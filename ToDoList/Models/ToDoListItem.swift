//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Ivan Bondaruk on 02/06/2025.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdAt: TimeInterval
    var isCompleted: Bool
    
    mutating func toggleCompletion(_ state: Bool) {
        isCompleted = state
    }
}
