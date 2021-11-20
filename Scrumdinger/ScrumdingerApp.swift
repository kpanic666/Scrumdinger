//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Andrei Korikov on 18.11.2021.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @ObservedObject private var data = ScrumData()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $data.scrums, saveAction: data.save)
            }
            .onAppear {
                data.load()
            }
        }
    }
}
