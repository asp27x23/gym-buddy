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
    private let exerciseName = Expression<String>("exerciseName")
    private let sets = Expression<Int64>("sets")
    private let reps = Expression<Int64>("reps")
    private let weight = Expression<Int64>("weight")

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
                table.column(exerciseName)
                table.column(sets)
                table.column(reps)
                table.column(weight)
            })
            print("Table Created...")
        } catch {
            print(error)
        }
    }

}
