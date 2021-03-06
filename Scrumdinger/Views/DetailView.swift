//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Andrei Korikov on 19.11.2021.
//

import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum
    @State private var isPresented = false
    @State private var data = DailyScrum.Data()
    
    var body: some View {
        List {
            Section {
                NavigationLink(destination: MeetingView(scrum: $scrum)) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                        .accessibilityLabel("Start meeting")
                }
                
                HStack {
                    Label("Length", systemImage: "clock")
                        .accessibilityLabel(Text("Meeting length"))
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                
                HStack {
                    Label("Color", systemImage: "paintpalette")
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(scrum.color)
                }
                .accessibilityElement(children: .ignore)
            } header: {
                Text("Meeting Info")
            }
            
            Section {
                ForEach(scrum.attendees, id: \.self) { attendee in
                    Label(attendee, systemImage: "person")
                        .accessibilityLabel(Text("Person"))
                        .accessibilityValue(Text(attendee))
                }
            } header: {
                Text("Attendees")
            }
            
            Section {
                if scrum.history.isEmpty {
                    Label("No meeting yet", systemImage: "calendar.badge.exclamationmark")
                }
                ForEach(scrum.history) { history in
                    NavigationLink(destination: HistoryView(history: history)) {
                        HStack {
                            Image(systemName: "calendar")
                            Text(history.date, style: .date)
                        }
                    }
                }
            } header: {
                Text("History")
            }
        }
        .listStyle(InsetGroupedListStyle())
        .toolbar {
            ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                Button {
                    isPresented = true
                    data = scrum.data
                } label: {
                    Text("Edit")
                }
            }
        }
        .navigationTitle(scrum.title)
        .fullScreenCover(isPresented: $isPresented) {
            NavigationView {
                EditView(scrumData: $data)
                    .navigationTitle(scrum.title)
                    .toolbar {
                        ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                            Button("Done") {
                                isPresented = false
                                scrum.update(from: data)
                            }
                        }
                        
                        ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                            Button("Cancel") {
                                isPresented = false
                            }
                        }
                    }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(scrum: .constant(DailyScrum.data[0]))
        }
    }
}
