//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Ivan Bondaruk on 02/06/2025.
//

import SwiftUI
import FirebaseFirestore

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    private let userID: String
    
    init(userID: String){
        self.userID = userID
        self._items = FirestoreQuery(collectionPath: "users/\(userID)/todos")
        
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userID: userID))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items){ item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button{
                                viewModel.deleteItem(itemId: item.id)
                            } label: {
                                Text("Delete")
                            }
                            .tint(.red)
                        }
                }
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button{
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(isPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userID: "TXanuhMFSfd1MOJEfERr5CbFeMG2")
}
