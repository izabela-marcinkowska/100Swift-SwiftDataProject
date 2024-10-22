//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Izabela Marcinkowska on 2024-10-19.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var showingUpcomingOnly = false
    @State private var sortOrder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate)
    ]
    @Query(filter: #Predicate<User> { user in
        user.name.contains("R")
    }, sort: \User.name) var users: [User]
    
    var body: some View {
        NavigationStack {
            UsersView(minimumJoinDate: showingUpcomingOnly ? .now : .distantPast, sortOrder: sortOrder)
            .navigationTitle("Users")
            .toolbar {
                Button("Add Samples", systemImage: "plus") {
                    try? modelContext.delete(model: User.self)
                    let first = User(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -10))
                    let second = User(name: "Rosa Diaz", city: "New York", joinDate: .now.addingTimeInterval(86400 * -5))
                    let third = User(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
                    let fourth = User(name: "Johnny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))

                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
                }
                
                Button(showingUpcomingOnly ? "Show Everyone" : "Show upcoming") {
                    showingUpcomingOnly.toggle()
                }
                Menu("Sort", systemImage: "arrpw.up.arrow.dowm") {
                    
                Picker("Sort", selection: $sortOrder) {
                    Text("Sort by name")
                        .tag([
                            SortDescriptor(\User.name),
                            SortDescriptor(\User.joinDate)
                        ])
                    Text("Sort by Join Date")
                        .tag([
                            SortDescriptor(\User.joinDate),
                            SortDescriptor(\User.name)
                        ])
                }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
