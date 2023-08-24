//
//  ExerciseDetailView.swift
//  Gym Buddy
//
//  Created by Alex Patel on 8/9/23.
//

import SwiftUI

struct ExerciseDetailView: View {

    @ObservedObject var viewModel: ExerciseDetailViewModel

    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Text("Exercise Name : ")
                TextField("Exercise Name", text: $viewModel.exerciseName)
                    .textFieldStyle(.roundedBorder)
            }
            HStack(spacing: 20) {
                Text("Sets")
                TextField("Sets", value: $viewModel.sets, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
                    .padding()
            }
            
            HStack(spacing: 20) {
                Text("Reps")
                TextField("Reps", value: $viewModel.reps, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
                    .padding()
            }
            
            HStack(spacing: 20) {
                Text("Weight")
                TextField("Weight", value: $viewModel.weight, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
                    .padding()
            }
            
            HStack(spacing: 20) {
                Text("Notes: ")
                TextField("Notes", text: $viewModel.notes)
                    .textFieldStyle(.roundedBorder)
            }

            HStack {
                Button(action: {
                    viewModel.onUpdateClick()
                }) {
                    Text("Update")
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
        .padding(.horizontal)
    }
}

