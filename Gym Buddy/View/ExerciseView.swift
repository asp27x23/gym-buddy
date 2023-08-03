//
//  ExerciseView.swift
//  Gym Buddy
//
//  Created by Alex Patel on 8/2/23.
//

import Foundation

class ExerciseView: ObservableObject {

    @Published var exerciseName: String = ""
    @Published var sets: Int64 = 0
    @Published var reps: Int64 = 0
    @Published var weight: Int64 = 0

    func onAddButtonClick() {
        if exerciseName != "" {
            let id = ExerciseDataStore.shared.insert(exerciseName: exerciseName, sets: sets, reps: reps, weight: weight)
            if id != nil {
                print("insert ", {id})
            }
        }
    }
}
