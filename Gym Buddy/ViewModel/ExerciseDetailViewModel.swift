//
//  ExerciseDetailViewModel.swift
//  Gym Buddy
//
//  Created by Alex Patel on 8/9/23.
//

import UIPilot
import Foundation

class ExerciseDetailViewModel: ObservableObject {

    var id: Int64
    var workoutId: Int64
    var exercise: Exercise?

    @Published var exerciseName: String = ""
    @Published var sets: Int64 = 0
    @Published var reps: Int64 = 0
    @Published var weight: Int64 = 0

    let appPilot: UIPilot<AppRoute>

    init(id: Int64, workoutId: Int64, pilot: UIPilot<AppRoute>) {
        self.id = id
        self.workoutId = workoutId
        self.appPilot = pilot
        getExercise()
    }

    func getExercise() {
        exercise = ExerciseDataStore.shared.findExercise(exerciseId: id, workoutId: workoutId)
        exerciseName = exercise?.exerciseName ?? ""
        sets = exercise?.sets ?? 0
        reps = exercise?.reps ?? 0
        weight = exercise?.weight ?? 0
    }

    func onUpdateClick() {
        let statusUpdated = ExerciseDataStore.shared.update(id: id, exerciseName: exerciseName, sets: sets, reps: reps, weight: weight)
        if statusUpdated {
            appPilot.pop()
        }
    }
}
