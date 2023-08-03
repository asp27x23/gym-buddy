//
//  WorkoutDetailView.swift
//  Gym Buddy
//
//  Created by Alex Patel on 8/3/23.
//

import SwiftUI

struct WorkoutDetailView: View {

    @ObservedObject var viewModel: WorkoutDetailViewModel

    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Text("Workout Name : ")
                TextField("Workout Name", text: $viewModel.workoutName)
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
