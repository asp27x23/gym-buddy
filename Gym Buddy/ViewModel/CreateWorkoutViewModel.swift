//
//  CreateWorkoutViewModel.swift
//  Gym Buddy
//
//  Created by Alex Patel on 8/3/23.
//

import UIPilot
import Foundation

class CreateWorkoutViewModel: ObservableObject {

    @Published var workoutName: String = ""
    @Published var date: Date = Date()


    private let appPilot: UIPilot<AppRoute>

    init(pilot: UIPilot<AppRoute>) {
        self.appPilot = pilot
    }

    func onSaveButtonClick() {
        if workoutName != "" {
            let id = WorkoutDataStore.shared.insert(name: workoutName, date: date)
            if id != nil {
                appPilot.pop()
            }
        }
    }
    
    func onAddExerciseButtonClick() {
        if workoutName != "" {
            let id = WorkoutDataStore.shared.insert(name: workoutName, date: date)
            if id != nil {
                appPilot.pop()
            }
        }
    }
}
