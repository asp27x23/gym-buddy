//
//  ExerciseDataStore.swift
//  Gym Buddy
//
//  Created by Alex Patel on 7/31/23.
//

import Foundation
import SQLite

class ExerciseDataStore {
    static let DIR_EXERCISE_DB = "ExerciseDB"
    static let STORE_NAME = "exercise.sqlite3"

    private let exercises = Table("exercises")

    private let id = Expression<Int64>("id")
    private let workoutId = Expression<Int64>("workoutId")
    private let exerciseName = Expression<String>("exerciseName")
    private let sets = Expression<Int64>("sets")
    private let reps = Expression<Int64>("reps")
    private let weight = Expression<Int64>("weight")
    private let notes = Expression<String>("notes")

    static let shared = ExerciseDataStore()

    private var db: Connection? = nil
    
    private init() {
        if let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dirPath = docDir.appendingPathComponent(Self.DIR_EXERCISE_DB)

            do {
                try FileManager.default.createDirectory(atPath: dirPath.path, withIntermediateDirectories: true, attributes: nil)
                let dbPath = dirPath.appendingPathComponent(Self.STORE_NAME).path
                db = try Connection(dbPath)
                createTable()
                print("SQLiteDataStore init successfully at: \(dbPath) ")
            } catch {
                db = nil
                print("SQLiteDataStore init error: \(error)")
            }
        } else {
            db = nil
        }
    }
    
    private func createTable() {
        guard let database = db else {
            return
        }
        do {
            try database.run(exercises.create { table in
                table.column(id, primaryKey: .autoincrement)
                table.column(workoutId)
                table.column(exerciseName)
                table.column(sets)
                table.column(reps)
                table.column(weight)
                table.column(notes)
            })
            print("Table Created...")
        } catch {
            print(error)
        }
    }
    
    func insert(workoutId: Int64, exerciseName: String, sets: Int64, reps: Int64, weight: Int64, notes: String) -> Int64?{
        guard let database = db else { return nil }

        let insert = exercises.insert(
              self.workoutId <- workoutId,
              self.exerciseName <- exerciseName,
              self.sets <- sets,
              self.reps <- reps,
              self.weight <- weight,
              self.notes <- notes
        )

        do {
            let rowID = try database.run(insert)
            return rowID
        } catch {
            print(error)
            return nil
        }
    }
    
    func getExercises(wId: Int64) -> [Exercise] {
        var exercises: [Exercise] = []
        guard let database = db else { return [] }

        let filter = self.exercises.filter(workoutId == wId)
        do {
            for exercise in try database.prepare(filter) {
                exercises.append(Exercise(id: exercise[id], workoutId: exercise[workoutId], exerciseName: exercise[exerciseName], sets: exercise[sets], reps: exercise[reps], weight: exercise[weight], notes: exercise[notes]))
            }
        } catch {
            print(error)
        }
        return exercises
    }
    
    func findExercise(exerciseId: Int64, workoutId: Int64) -> Exercise? {
        var exercise: Exercise = Exercise(id: exerciseId, workoutId: workoutId, exerciseName: "", sets: 0, reps: 0, weight: 0, notes: "")
        guard let database = db else { return nil }

        let filter = self.exercises.filter(id == exerciseId)
        do {
            for e in try database.prepare(filter) {
                exercise.exerciseName = e[exerciseName]
                exercise.sets = e[sets]
                exercise.reps = e[reps]
                exercise.weight = e[weight]
                exercise.notes = e[notes]
            }
        } catch {
            print(error)
        }
        return exercise
    }

    
    func delete(id: Int64) -> Bool {
        guard let database = db else {
            return false
        }
        do {
            let filter = exercises.filter(self.id == id)
            try database.run(filter.delete())
            return true
        } catch {
            print(error)
            return false
        }
    }
    
    func update(id: Int64, exerciseName: String, sets: Int64, reps: Int64, weight: Int64, notes: String) -> Bool {
        guard let database = db else { return false }

        let exercise = exercises.filter(self.id == id)
        do {
            let update = exercise.update([
                self.exerciseName <- exerciseName,
                self.sets <- sets,
                self.reps <- reps,
                self.weight <- weight,
                self.notes <- notes
            ])
            if try database.run(update) > 0 {
                return true
            }
        } catch {
            print(error)
        }
        return false
    }
}
