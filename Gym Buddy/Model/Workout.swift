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
    @State var exercises = [Exercise]()
}
