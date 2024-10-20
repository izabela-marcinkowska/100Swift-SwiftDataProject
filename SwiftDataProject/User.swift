//
//  User.swift
//  SwiftDataProject
//
//  Created by Izabela Marcinkowska on 2024-10-20.
//

import Foundation
import SwiftData

@Model
class User {
    var name: String
    var city: String
    var joinDate: Date
    
    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}
