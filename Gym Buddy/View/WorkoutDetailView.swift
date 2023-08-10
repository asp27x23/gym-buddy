//
//  WorkoutDetailView.swift
//  Gym Buddy
//
//  Created by Alex Patel on 8/3/23.
//

import SwiftUI

struct WorkoutDetailView: View {

    @ObservedObject var viewModel: WorkoutDetailViewModel
    @ObservedObject var viewExerciseModel: CreateExerciseViewModel
    @State var exercises = ExerciseDataStore.shared.getExercises(wId: 0) // TODO: need to determine the workout id dynamically

    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Text("Workout Name : ")
                TextField("Workout Name", text: $viewModel.workoutName)
                    .textFieldStyle(.roundedBorder)
            }
            
            HStack(spacing: 20) {
                Text("Date :")
                DatePicker("", selection: $viewModel.date)
                Spacer()
            }
            
            HStack(spacing: 20) {
                List {
                    Section {
                        ForEach(exercises, id: \.id) { exercise in
                            Text(exercise.exerciseName)
                                .onTapGesture {
                                    viewModel.appPilot.push(.ExerciseDetail(id: exercise.id, workoutId: exercise.workoutId))
                                }
                        }
                        .onDelete(perform: viewModel.deleteExercise(at:))
                    } header: {
                        Text("Exercises")
                    }
                    
                    Button(action: {
                        viewExerciseModel.appPilot.push(.CreateExercise(id: viewModel.id))
                    }) {
                        Label("Add Exercise", systemImage: "plus")
                    }
                }
                .listStyle(.plain)
                .onAppear {
                    UITableView.appearance().backgroundColor = .clear
                    UITableViewCell.appearance().selectionStyle = .none
                    UITableView.appearance().showsVerticalScrollIndicator = false
                }
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
