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

    private let appPilot: UIPilot<AppRoute>

    init(pilot: UIPilot<AppRoute>) {
        self.appPilot = pilot
    }

    func onAddButtonClick() {
        if workoutName != "" {
            let id = WorkoutDataStore.shared.insert(name: workoutName)
            if id != nil {
                appPilot.pop()
            }
        }
    }
}
