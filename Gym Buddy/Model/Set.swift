//
//  Set.swift
//  Gym Buddy
//
//  Created by Alex Patel on 7/6/23.
//

import SwiftUI

struct Set {
    var setReps = 0
    var setWeight = 0
    
    init(reps : Int, weight : Int) {
        setReps = reps
        setWeight = weight
    }
    
    func getReps() -> Int {
        return self.setReps
    }
    
    func getWeight() -> Int {
        return self.setWeight
    }
    
}
