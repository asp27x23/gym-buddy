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
    var notes: String
}

