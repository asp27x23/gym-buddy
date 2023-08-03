//
//  ProfileView.swift
//  Gym Buddy
//
//  Created by Alex Patel on 6/27/23.
//

import SwiftUI

struct ProfileView: View {
    
    let now = Date.now
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(Date().weekdayNameFull + " ")
                .font(.title)
            +
            Text(Date.now, format: .dateTime.day().month().year())
                .font(.title)
            Spacer()
        }
    }
    
}

extension Date {
    var weekdayNameFull: String {
        let formatter = DateFormatter(); formatter.dateFormat = "EEEE"
        return formatter.string(from: self as Date)
    }
}
