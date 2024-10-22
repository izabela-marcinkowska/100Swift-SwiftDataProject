//
//  UsersView.swift
//  SwiftDataProject
//
//  Created by Izabela Marcinkowska on 2024-10-21.
//

import SwiftUI
import SwiftData

struct UsersView: View {
    @Query var users: [User]
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
    
    var body: some View {
        List(users) { user in
            Text(user.name)
        }
    }
}

#Preview {
    UsersView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\User.name)])
        .modelContainer(for: User.self)
}
