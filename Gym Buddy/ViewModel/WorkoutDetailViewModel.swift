//
//  WorkoutDetailViewModel.swift
//  Gym Buddy
//
//  Created by Alex Patel on 8/3/23.
//

import UIPilot
import Foundation

class WorkoutDetailViewModel: ObservableObject {

    var id: Int64
    var workout: Workout?

    @Published var workoutName: String = ""

    private let appPilot: UIPilot<AppRoute>

    init(id: Int64, pilot: UIPilot<AppRoute>) {
        self.id = id
        self.appPilot = pilot
        getWorkout()
    }

    func getWorkout() {
        workout = WorkoutDataStore.shared.findWorkouts(workoutId: id)
        workoutName = workout?.name ?? ""
    }

    func onUpdateClick() {
        let statusUpdated = WorkoutDataStore.shared.update(id: id, name: workoutName)
        if statusUpdated {
            appPilot.pop()
        }
    }
}
