//
//  CreateExerciseView.swift
//  Gym Buddy
//
//  Created by Alex Patel on 8/6/23.
//

import SwiftUI

struct CreateExerciseView: View {

    @ObservedObject var viewExerciseModel: CreateExerciseViewModel
    @State private var exerciseName: String = ""
    @State private var sets: Int = 1
    @State private var reps: Int = 1
    @State private var weight: Int = 1

    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Text("Exercise Name : ")
                TextField("Exercise Name", text: $viewExerciseModel.exerciseName)
                    .textFieldStyle(.roundedBorder)
            }
            
            HStack(spacing: 20) {
                Text("Sets")
                Picker("Sets", selection: $viewExerciseModel.sets) {
                    ForEach(1...10, id: \.self) { sets in
                        Text("\(sets)")
                    }
                }
            }
            
            HStack(spacing: 20) {
                Text("Reps")
                Picker("Reps", selection: $viewExerciseModel.reps) {
                    ForEach(1...25, id: \.self) { reps in
                        Text("\(reps)")
                    }
                }
            }
            
            HStack(spacing: 20) {
                Text("Weight")
                TextField("Weight", value: $viewExerciseModel.weight, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .padding()
            }
            
            HStack {
                Button(action: {
                    viewExerciseModel.onSaveButtonClick()
                }) {
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 30)
                }
                .background(.blue)
                .cornerRadius(.infinity)
                .padding()
            }
            Spacer()
        }
    }

}
