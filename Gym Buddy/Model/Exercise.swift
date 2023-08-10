//
//  Exercise.swift
//  Gym Buddy
//
//  Created by Alex Patel on 7/6/23.
//

import SwiftUI

struct Exercise: Identifiable {
    let id: Int64
    var workoutId: Int64
    var exerciseName: String
    var sets: Int64
    var reps: Int64
    var weight: Int64
    
    static func preview() -> [Exercise] {
        return [Exercise(id: 1, workoutId: 1, exerciseName: "flat bench", sets: 3, reps: 10, weight: 135),
                    Exercise(id: 2, workoutId: 1, exerciseName: "incline bench", sets: 3, reps: 10, weight: 120),
                    Exercise(id: 3, workoutId: 1, exerciseName: "chest flies", sets: 3, reps: 10, weight: 30)
            ]
        }
}

