//
//  CreateWorkoutView.swift
//  Gym Buddy
//
//  Created by Alex Patel on 7/6/23.
//

import SwiftUI

struct CreateWorkoutView: View {

    @ObservedObject var viewModel: CreateWorkoutViewModel

    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Text("Workout Name : ")
                TextField("Workout Name", text: $viewModel.workoutName)
                    .textFieldStyle(.roundedBorder)
            }
            .padding()

            HStack {
                Button(action: {
                    viewModel.onAddButtonClick()
                }) {
                    Text("Add")
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
