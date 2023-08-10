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
    @Published var date: Date = Date()
    @Published var allExercises: [Exercise] = []
    @Published var exerciseName: String = ""
    @Published var sets: Int64 = 0
    @Published var reps: Int64 = 0
    @Published var weight: Int64 = 0

    let appPilot: UIPilot<AppRoute>

    init(id: Int64, pilot: UIPilot<AppRoute>) {
        self.id = id
        self.appPilot = pilot
        getWorkout()
    }

    func getWorkout() {
        workout = WorkoutDataStore.shared.findWorkouts(workoutId: id)
        workoutName = workout?.name ?? ""
        date = workout?.date ?? Date()
    }

    func onUpdateClick() {
        let statusUpdated = WorkoutDataStore.shared.update(id: id, name: workoutName, date: date)
        if statusUpdated {
            appPilot.pop()
        }
    }
    
    func deleteExercise(at indexSet: IndexSet) {
        let id = indexSet.map { self.allExercises[$0].id }.first
        if let id = id {
            let delete = ExerciseDataStore.shared.delete(id: id)
            if delete {
                getExerciseList()
            }
        }
    }
    
    func getExerciseList() {
        allExercises = ExerciseDataStore.shared.getExercises(wId: id)
    }
}
