//
//  Workout.swift
//  Gym Buddy
//
//  Created by Alex Patel on 6/30/23.
//

import SwiftUI

struct Workout {
    let id: Int64
    var name: String
    var date: Date
    var notes: String
    @State var exercises = [Exercise]()
}
