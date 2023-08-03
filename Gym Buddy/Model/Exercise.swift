//
//  Exercise.swift
//  Gym Buddy
//
//  Created by Alex Patel on 7/6/23.
//

import SwiftUI

struct Exercise {
    let id: Int64
    var exerciseName: String
    var sets: Int64
    var reps: Int64
    var weight: Int64
}


let id = ExerciseDataStore.shared.insert(exerciseName: "flat bench", sets: 3, reps: 10, weight: 135)
