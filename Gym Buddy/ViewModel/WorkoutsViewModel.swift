//
//  WorkoutsViewModel.swift
//  Gym Buddy
//
//  Created by Alex Patel on 8/2/23.
//

import Foundation
import UIPilot

class WorkoutsViewModel: ObservableObject {

    @Published var allWorkouts: [Workout] = []
    let appPilot: UIPilot<AppRoute>

    init(pilot: UIPilot<AppRoute>) {
        self.appPilot = pilot
    }

    func onAddButtonClick() {
        appPilot.push(.Insert)
    }

    func getWorkoutList() {
        allWorkouts = WorkoutDataStore.shared.getAllWorkouts()
    }

    func deleteWorkout(at indexSet: IndexSet) {
        let id = indexSet.map { self.allWorkouts[$0].id }.first
        if let id = id {
            let delete = WorkoutDataStore.shared.delete(id: id)
            if delete {
                getWorkoutList()
            }
        }
    }
}
