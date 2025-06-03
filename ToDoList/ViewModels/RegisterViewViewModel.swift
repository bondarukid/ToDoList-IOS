//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Ivan Bondaruk on 02/06/2025.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel:ObservableObject {
    
    @Published var fullName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    init () {
        
    }
    
    func register() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserToFirestore(userId: userId)
        }
    }
    
    private func insertUserToFirestore(userId: String) {
        let newUser = User(id: userId, fullName: fullName, email: email, joinedAt: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .setData(newUser.asDictionary())
            
    }
    
    private func validate() -> Bool {
        errorMessage = "" // Reset errorMessage to not see it again
        
        // Going to validate for not empty and spacers
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty,
                !fullName.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill all fields"
            return false
        }
        
        // validate email for @ and .
        guard email.contains( "@" ) && email.contains( "." ) else {
            errorMessage = "Please enter valid email"
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage = "Password must be at least 6 characters long"
            return false
        }
        
        return true
    }
}
