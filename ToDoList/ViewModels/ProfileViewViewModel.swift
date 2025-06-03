//
//  ProfileViewViewModel.swift
//  ToDoList
//
//  Created by Ivan Bondaruk on 02/06/2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewViewModel: ObservableObject {
    @Published var user: User? = nil
    
    init(){
        
    }
    
    func fetchUser(){
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument { snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.user = User(
                    id: data["id"] as? String ?? "",
                    fullName: data["fullName"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    joinedAt: data["joinedAt"] as? TimeInterval ?? 0)
            }
        }
    }
}
