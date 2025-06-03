//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Ivan Bondaruk on 02/06/2025.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel : ObservableObject{
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    init () {

    }
    
    func login() {
        guard validate() else {
            return
        }
        
        // Try to log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        errorMessage = "" // Reset errorMessage to not see it again
        
        // Going to validate for not empty and spacers
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please enter email and password"
            return false
        }
        
        // validate email for @ and .
        guard email.contains( "@" ) && email.contains( "." ) else {
            errorMessage = "Please enter valid email"
            return false
        }
        
        return true
    }
}
