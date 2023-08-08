//
//  CreateExerciseView.swift
//  Gym Buddy
//
//  Created by Alex Patel on 8/6/23.
//

import SwiftUI

struct CreateExerciseView: View {

    //@ObservedObject var viewExerciseModel: CreateExerciseViewModel
    @State private var exerciseName: String = ""
    @State private var sets: Int = 1
    @State private var reps: Int = 1
    @State private var weight: Int = 1

    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Text("Exercise Name : ")
                TextField("Exercise Name", text: $exerciseName)
                    .textFieldStyle(.roundedBorder)
            }
            .padding()
            
            HStack(spacing: 20) {
                Picker("Sets", selection: $sets) {
                    ForEach(1...10, id: \.self) { sets in
                        Text("\(sets)")
                    }
                }
            }
            .padding()
            
            HStack(spacing: 20) {
                Picker("Reps", selection: $reps) {
                    ForEach(1...25, id: \.self) { reps in
                        Text("\(reps)")
                    }
                }
            }
            .padding()
            
            HStack(spacing: 20) {
                TextField("Weight", value: $weight, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .padding()
            }
            .padding()
            
            HStack {
                Button(action: {
                    onAddExerciseButtonClick()
                }) {
                    Text("Add Exercise")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 30)
                }
                .background(.blue)
                .cornerRadius(.infinity)
                .padding()
            }
            
            HStack {
                Button(action: {
                    onSaveButtonClick()
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
    
    func onSaveButtonClick() {
        
    }
    
    func onAddExerciseButtonClick() {
        
    }
}
