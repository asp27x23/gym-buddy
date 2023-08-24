//
//  CreateWorkoutViewModel.swift
//  Gym Buddy
//
//  Created by Alex Patel on 8/3/23.
//

import UIPilot
import Foundation

class CreateWorkoutViewModel: ObservableObject {

    @Published var workoutName: String = ""
    @Published var date: Date = Date()
    @Published var notes: String = ""
    
    let appPilot: UIPilot<AppRoute>

    init(pilot: UIPilot<AppRoute>) {
        self.appPilot = pilot
    }

    func onSaveButtonClick() {
        if workoutName != "" {
            let id = WorkoutDataStore.shared.insert(name: workoutName, date: date, notes: notes)
            if id != nil {
                appPilot.pop()
            }
        }
    }
    
}
