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
    @Published var notes: String = ""

    let appPilot: UIPilot<AppRoute>

    init(id: Int64, pilot: UIPilot<AppRoute>) {
        self.appPilot = pilot
        self.workoutId = id
    }

    func onSaveButtonClick() {
        print("try to save exercise: ", exerciseName, workoutId, exerciseName, sets, reps, weight)
        if exerciseName != "" {
            let id = ExerciseDataStore.shared.insert(workoutId: workoutId, exerciseName: exerciseName, sets: sets, reps: reps, weight: weight, notes: notes)
            if id != nil {
                appPilot.pop()
            }
        }
    }
}
