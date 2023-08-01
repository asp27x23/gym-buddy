//
//  ContentView.swift
//  Gym Buddy
//
//  Created by Alex Patel on 6/26/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView {
            ProfileView()
                .tabItem ( { VStack {
                    Text("Profile")
                    }
                }).tag(0)
            WorkoutsView()
                .tabItem ( { VStack {
                    Text("Workouts")
                    }
                }).tag(1)
            StatsView()
                .tabItem ( { VStack {
                    Text("Stats")
                    }
                }).tag(1)
        }.environment(\.colorScheme, .light)
    }
    
}
