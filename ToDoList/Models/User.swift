//
//  User.swift
//  ToDoList
//
//  Created by Ivan Bondaruk on 02/06/2025.
//

import Foundation

struct User: Codable {
    let id: String
    let fullName: String
    let email: String
    let joinedAt: TimeInterval
}
