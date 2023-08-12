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
                    TextField("Sets", value: $viewExerciseModel.sets, format: .number)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                        .padding()
                }
                
                HStack(spacing: 20) {
                    Text("Reps")
                    TextField("Reps", value: $viewExerciseModel.reps, format: .number)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                        .padding()
                }
                
                HStack(spacing: 20) {
                    Text("Weight")
                    TextField("Weight", value: $viewExerciseModel.weight, format: .number)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
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
