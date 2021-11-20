//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Andrei Korikov on 19.11.2021.
//

import SwiftUI

struct MeetingHeaderView: View {
    let secondsElapsed: Int
    let secondsRemaining: Int
    let scrumColor: Color
    private var progress: Double {
        guard secondsRemaining > 0 else { return 1 }
        let totalSeconds = Double(secondsElapsed + secondsRemaining)
        return Double(secondsElapsed) / totalSeconds
    }
    private var minutesRemaining: Int {
        secondsRemaining / 60
    }
    private var minutesRemainingMetric: String {
        minutesRemaining == 1 ? "minute" : "minutes"
    }
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(ScrumProgressViewStyle(scrumColor: scrumColor))
            
            HStack {
                VStack(alignment: .leading) {
                    Text(/*@START_MENU_TOKEN@*/"Seconds Elapsed"/*@END_MENU_TOKEN@*/)
                        .font(.caption)
                    Label(String(secondsElapsed), systemImage: /*@START_MENU_TOKEN@*/"hourglass.bottomhalf.fill"/*@END_MENU_TOKEN@*/)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    HStack {
                        Text("\(secondsRemaining)")
                        Image(systemName: "hourglass.tophalf.fill")
                    }
                }
            }
        }
        .padding([.top, .horizontal])
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("\(minutesRemaining) \(minutesRemainingMetric)")
    }
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondsElapsed: 60, secondsRemaining: 180, scrumColor: DailyScrum.data[0].color)
            .previewLayout(.sizeThatFits)
    }
}
