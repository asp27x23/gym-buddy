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
                        WorkoutDetailView(viewModel: WorkoutDetailViewModel(id: id, pilot: pilot))
                    )
                case .CreateExercise:
                    return AnyView(
                        CreateExerciseView()
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
    case CreateExercise
}
