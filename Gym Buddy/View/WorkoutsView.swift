//
//  WorkoutsView.swift
//  Gym Buddy
//
//  Created by Alex Patel on 6/26/23.
//

import SwiftUI

struct WorkoutsView: View {

    @ObservedObject var viewModel: WorkoutsViewModel

    var body: some View {
        ZStack {
            VStack(spacing: 30) {
                Text("Workouts")
                    .font(.title.bold())

                if viewModel.allWorkouts.isEmpty {
                    Text("You have no workouts.")
                } else {
                    List {
                        ForEach(viewModel.allWorkouts, id: \.id) { workout in
                            Text(workout.name)
                                .onTapGesture {
                                    viewModel.appPilot.push(.Detail(id: workout.id))
                                }
                        }
                        .onDelete(perform: viewModel.deleteWorkout(at:))
                    }
                    .listStyle(.plain)
                    .onAppear {
                        UITableView.appearance().backgroundColor = .clear
                        UITableViewCell.appearance().selectionStyle = .none
                        UITableView.appearance().showsVerticalScrollIndicator = false
                    }
                }
            }

            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        viewModel.onAddButtonClick()
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.white)
                            .padding(20)
                    }
                    .background(.blue)
                    .cornerRadius(.infinity)
                    .padding()
                }
            }
        }
        .onAppear {
            viewModel.getWorkoutList()
        }
        .navigationBarHidden(true)
    }
}
