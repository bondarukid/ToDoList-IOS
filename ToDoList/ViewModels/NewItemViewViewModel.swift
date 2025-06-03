//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Ivan Bondaruk on 02/06/2025.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var date: Date = Date()
    @Published var showAlert: Bool = false
    
    init () {
        
    }
    
    func save(){
        guard validate else {
            return showAlert = true
        }
        
        // Get user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create model
        let UUID = UUID().uuidString
        let newItem = ToDoListItem(
            id: UUID,
            title: title,
            dueDate: date.timeIntervalSince1970,
            createdAt: date.timeIntervalSince1970,
            isCompleted: false)
        
        // Save
        let db = Firestore.firestore()
            .collection("users")
            .document(uId)
            .collection("todos")
            .document(UUID)
            .setData(newItem.asDictionary())
    }
    
    var validate: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard date >= Date().addingTimeInterval(86400) else {
            return false
        }
        
        return true
    }
}
