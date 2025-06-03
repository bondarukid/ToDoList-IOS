//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Ivan Bondaruk on 02/06/2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoListItemViewViewModel:ObservableObject {
    
    init(){
        
    }
    
    func toogleIsCompleted(item: ToDoListItem){
        var newItem = item
        newItem.toggleCompletion(!item.isCompleted)
        
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let gb = Firestore.firestore()
            .collection("users")
                .document(userId)
                .collection("todos")
                .document(newItem.id)
                .setData(newItem.asDictionary())
    }
}
