//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Andrei Korikov on 18.11.2021.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.data
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
