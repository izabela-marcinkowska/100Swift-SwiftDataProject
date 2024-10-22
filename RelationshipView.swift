//
//  RelationshipView.swift
//  SwiftDataProject
//
//  Created by Izabela Marcinkowska on 2024-10-22.
//

import SwiftUI
import SwiftData

struct RelationshipView: View {
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]
    var body: some View {
        List(users) { user in
            HStack {
                Text(user.name)
                Spacer()
                Text(String(user.jobs.count))
                            .fontWeight(.black)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(.capsule)
            }
        }
        Button("Add stuff") {
            addSample()
        }
    }
    func addSample() {
        let user1 = User(name: "Piper Chapman", city: "New York", joinDate: .now)
        let job1 = Job(name: "Organize sock drawer", priority: 3)
        let job2 = Job(name: "Make plans with Alex", priority: 4)

        modelContext.insert(user1)

        user1.jobs.append(job1)
        user1.jobs.append(job2)
    }
}

#Preview {
    RelationshipView()
}
