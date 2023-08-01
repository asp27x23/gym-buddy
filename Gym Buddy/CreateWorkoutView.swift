//
//  CreateWorkoutView.swift
//  Gym Buddy
//
//  Created by Alex Patel on 7/6/23.
//

import SwiftUI

struct CreateWorkoutView: View {
    
    @State var workoutName: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("List of Workouts")
                Spacer()
            }
            HStack {
                Spacer()
                Text("Name")
                Spacer()
                TextField("", text: $workoutName)
            }
            
            Button("Add Exercise") {} // TODO exercise picker - ideally a list of exercises that is searchable
                .multilineTextAlignment(.center)
        }
    }
}
