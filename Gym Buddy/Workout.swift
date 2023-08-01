//
//  Workout.swift
//  Gym Buddy
//
//  Created by Alex Patel on 6/30/23.
//

import SwiftUI

struct Workout {
    var name = ""
    @State var exercises = [Exercise]()
    
    init(name: String = "") {
        self.name = name
    }
    
    func addExercise(name : String) {
        exercises.append(Exercise(name : name))
    }
    
    func modifySet(key : Int, name : String) {
        exercises[key] = Exercise(name : name)
    }
    
    func deleteSet(key : Int) {
        exercises.remove(at: key)
    }
    
}
