//
//  CreateExerciseViewModel.swift
//  Gym Buddy
//
//  Created by Alex Patel on 8/6/23.
//

import UIPilot
import Foundation

class CreateExerciseViewModel: ObservableObject {

    @Published var workoutId: Int64 = 0
    @Published var exerciseName: String = ""
    @Published var sets: Int64 = 0
    @Published var reps: Int64 = 0
    @Published var weight: Int64 = 0

    private let appPilot: UIPilot<AppRoute>

    init(pilot: UIPilot<AppRoute>) {
        self.appPilot = pilot
    }

    func onSaveButtonClick() {
        if exerciseName != "" {
            let id = ExerciseDataStore.shared.insert(exerciseName: exerciseName, sets: sets, reps: reps, weight: weight)
            if id != nil {
                appPilot.pop()
            }
        }
    }
    
    func onAddExerciseButtonClick() {
        if exerciseName != "" {
            let id = ExerciseDataStore.shared.insert(exerciseName: exerciseName, sets: sets, reps: reps, weight: weight)
            if id != nil {
                appPilot.pop()
            }
        }
    }
}
