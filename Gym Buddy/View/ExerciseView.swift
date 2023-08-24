//
//  ExerciseView.swift
//  Gym Buddy
//
//  Created by Alex Patel on 8/2/23.
//

import Foundation

class ExerciseView: ObservableObject {

    @Published var workoutId: Int64 = 0
    @Published var exerciseName: String = ""
    @Published var sets: Int64 = 0
    @Published var reps: Int64 = 0
    @Published var weight: Int64 = 0
    @Published var notes: String = ""

    func onAddButtonClick() {
        if exerciseName != "" {
            let id = ExerciseDataStore.shared.insert(workoutId: workoutId, exerciseName: exerciseName, sets: sets, reps: reps, weight: weight, notes: notes)
            if id != nil {
                print("insert ", {id})
            }
        }
    }
}
