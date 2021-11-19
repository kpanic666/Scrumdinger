//
//  EditView.swift
//  Scrumdinger
//
//  Created by Andrei Korikov on 19.11.2021.
//

import SwiftUI

struct EditView: View {
    @Binding var scrumData: DailyScrum.Data
    @State private var newAttendee = ""
    
    var body: some View {
        List {
            Section {
                TextField("Title", text: $scrumData.title)
                HStack {
                    Slider(value: $scrumData.lengthInMinutes, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    .accessibilityValue("\(Int(scrumData.lengthInMinutes)) minutes")
                    
                    Spacer()
                    
                    Text("\(Int(scrumData.lengthInMinutes)) minutes")
                        .accessibilityHidden(true)
                }
                
                ColorPicker("Color", selection: $scrumData.color)
                    .accessibilityLabel("Color picker")
            } header: {
                Text("Meeting Info")
            }
            
            Section {
                ForEach(scrumData.attendees, id: \.self) {
                    Text($0)
                }
                .onDelete { indices in
                    scrumData.attendees.remove(atOffsets: indices)
                }
                
                HStack {
                    TextField("New Attendee", text: $newAttendee)
                    Button {
                        withAnimation {
                            scrumData.attendees.append(newAttendee)
                            newAttendee = ""
                        }
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(newAttendee.isEmpty)
                }
            } header: {
                Text("Attendees")
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(scrumData: .constant(DailyScrum.data[0].data))
.previewInterfaceOrientation(.portrait)
    }
}
