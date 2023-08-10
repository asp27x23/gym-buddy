//
//  ContentView.swift
//  Gym Buddy
//
//  Created by Alex Patel on 6/26/23.
//

import UIPilot
import SwiftUI

@main
struct GymBuddyApp: App {

    private let pilot: UIPilot<AppRoute>

    init() {
        pilot = .init(initial: .List)
    }

    var body: some Scene {
        WindowGroup {
            UIPilotHost(pilot) { route in
                switch route {
                case .List:
                    return AnyView(
                        WorkoutsView(viewModel: WorkoutsViewModel(pilot: pilot))
                    )
                case .Insert:
                    return AnyView(
                        CreateWorkoutView(viewModel: CreateWorkoutViewModel(pilot: pilot))
                    )
                case .Detail(let id):
                    return AnyView(
                        WorkoutDetailView(viewModel: WorkoutDetailViewModel(id: id, pilot: pilot), viewExerciseModel: CreateExerciseViewModel(id: id, pilot: pilot))
                    )
                case .CreateExercise(let id):
                    return AnyView(
                        CreateExerciseView(viewExerciseModel: CreateExerciseViewModel(id: id, pilot: pilot))
                    )
                case .ExerciseDetail(let id, let workoutId):
                    return AnyView(
                        ExerciseDetailView(viewModel: ExerciseDetailViewModel(id: id, workoutId: workoutId, pilot: pilot))
                    )
                }
            }
        }
    }
    
}


enum AppRoute: Equatable {
    case List
    case Insert
    case Detail(id: Int64)
    case CreateExercise(id: Int64)
    case ExerciseDetail(id: Int64, workoutId: Int64)
}
