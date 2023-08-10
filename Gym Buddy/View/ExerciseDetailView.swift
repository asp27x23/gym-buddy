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
                Picker("Sets", selection: $viewModel.sets) {
                    ForEach(1...10, id: \.self) { sets in
                        Text("\(sets)")
                    }
                }
            }
            
            HStack(spacing: 20) {
                Text("Reps")
                Picker("Reps", selection: $viewModel.reps) {
                    ForEach(1...25, id: \.self) { reps in
                        Text("\(reps)")
                    }
                }
            }
            
            HStack(spacing: 20) {
                Text("Weight")
                TextField("Weight", value: $viewModel.weight, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .padding()
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

