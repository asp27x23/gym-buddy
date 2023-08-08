//
//  WorkoutDataStore.swift
//  Gym Buddy
//
//  Created by Alex Patel on 8/2/23.
//

import Foundation
import SQLite

class WorkoutDataStore {

    static let DIR_WORKOUT_DB = "WorkoutDB"
    static let STORE_NAME = "workout.sqlite3"

    private let workouts = Table("workouts")

    private let id = Expression<Int64>("id")
    private let workoutName = Expression<String>("workoutName")
    private let date = Expression<Date>("date")

    static let shared = WorkoutDataStore()

    private var db: Connection? = nil

    private init() {
        if let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dirPath = docDir.appendingPathComponent(Self.DIR_WORKOUT_DB)

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
            try database.run(workouts.create { table in
                table.column(id, primaryKey: .autoincrement)
                table.column(workoutName)
                table.column(date)
            })
            print("Table Created...")
        } catch {
            print(error)
        }
    }

    func insert(name: String, date: Date) -> Int64? {
        guard let database = db else { return nil }

        let insert = workouts.insert(self.workoutName <- name, self.date <- date)

        do {
            let rowID = try database.run(insert)
            return rowID
        } catch {
            print(error)
            return nil
        }
    }

    func getAllWorkouts() -> [Workout] {
        var workouts: [Workout] = []
        guard let database = db else { return [] }

        do {
            for workout in try database.prepare(self.workouts) {
                workouts.append(Workout(id: workout[id], name: workout[workoutName], date: workout[date]))
            }
        } catch {
            print(error)
        }
        return workouts
    }


    func findWorkouts(workoutId: Int64) -> Workout? {
        var workout: Workout = Workout(id: workoutId, name: "", date: Date())
        guard let database = db else { return nil }

        let filter = self.workouts.filter(id == workoutId)
        do {
            for t in try database.prepare(filter) {
                workout.name = t[workoutName]
                workout.date = t[date]
            }
        } catch {
            print(error)
        }
        return workout
    }

    func update(id: Int64, name: String, date: Date = Date()) -> Bool {
        guard let database = db else { return false }

        let workout = workouts.filter(self.id == id)
        do {
            let update = workout.update([
                workoutName <- name,
                self.date <- date
            ])
            if try database.run(update) > 0 {
                return true
            }
        } catch {
            print(error)
        }
        return false
    }

    func delete(id: Int64) -> Bool {
        guard let database = db else {
            return false
        }
        do {
            let filter = workouts.filter(self.id == id)
            try database.run(filter.delete())
            return true
        } catch {
            print(error)
            return false
        }
    }
}
