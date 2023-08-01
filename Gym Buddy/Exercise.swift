//
//  Exercise.swift
//  Gym Buddy
//
//  Created by Alex Patel on 7/6/23.
//

import SwiftUI

struct Exercise {
    var name = ""
    @State var sets = [Set]()
    
    init(name : String = "") {
        self.name = name
    }
    
    func addSet(setReps : Int, setWeight : Int) {
        sets.append(Set(reps : setReps, weight : setWeight))
    }
    
    func modifySet(key : Int, setReps : Int, setWeight : Int) {
        sets[key] = Set(reps : setReps, weight : setWeight)
    }
    
    func deleteSet(key : Int) {
        sets.remove(at: key)
    }
}
