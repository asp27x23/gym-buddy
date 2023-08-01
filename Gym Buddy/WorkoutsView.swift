//
//  WorkoutsView.swift
//  Gym Buddy
//
//  Created by Alex Patel on 6/26/23.
//

import SwiftUI

struct WorkoutsView: View {
    
    @State private var selection: String? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    NavigationLink(destination: CreateWorkoutView(), tag: "A", selection: $selection) { EmptyView() }
                    
                    Button("+") {
                        selection = "A"
                    }.font(.system(size: 60))
                        .frame(width: 100, height: 60)
                }
                .navigationTitle("Workouts")
                Spacer()
            }
        }
    }
}
