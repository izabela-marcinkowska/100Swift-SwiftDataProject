//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Izabela Marcinkowska on 2024-10-19.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
