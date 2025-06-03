//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Ivan Bondaruk on 02/06/2025.
//

import FirebaseFirestore
import Foundation

class ToDoListViewViewModel:ObservableObject {
    @Published var showingNewItemView: Bool = false
    
    private let userID: String
    
    init (userID: String) {
        self.userID = userID
    }
    
    /// Delete item form db
    ///  - Parameter itemId: item id to delete
    func deleteItem(itemId: String){
        let db = Firestore.firestore()
            .collection("users")
            .document(userID)
            .collection("todos")
            .document(itemId)
            .delete()
    }
}
