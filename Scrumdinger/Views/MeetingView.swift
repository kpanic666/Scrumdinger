//
//  MeetingView.swift
//  Scrumdinger
//
//  Created by Andrei Korikov on 18.11.2021.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
            ProgressView(value: 5, total: 15)
            HStack {
                VStack(alignment: .leading) {
                    Text(/*@START_MENU_TOKEN@*/"Seconds Elapsed"/*@END_MENU_TOKEN@*/)
                        .font(.caption)
                    Label("300", systemImage: /*@START_MENU_TOKEN@*/"hourglass.bottomhalf.fill"/*@END_MENU_TOKEN@*/)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("600", systemImage: /*@START_MENU_TOKEN@*/"hourglass.tophalf.fill"/*@END_MENU_TOKEN@*/)
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time remaining")
            .accessibilityValue("10 minutes")
            
            Circle()
                .strokeBorder(lineWidth: 24, antialiased: true)
            
            HStack {
                Text("Speaker 1 of 3")
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "forward.fill")
                }
                .accessibilityLabel("Next speaker")
            }
        }
        .padding()
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView()
    }
}
