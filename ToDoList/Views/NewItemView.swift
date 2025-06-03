//
//  NewItemView.swift
//  ToDoList
//
//  Created by Ivan Bondaruk on 02/06/2025.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack{
            Text("New item")
                .bold()
                .font(.system(size: 32))
                .padding(.top, 100)
            
            Form{
                // Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // Date
                DatePicker("Due date", selection: $viewModel.date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                //Button
                TLButtonView(title: "Save", backgroundColor: .pink) {
                    if viewModel.validate {
                        viewModel.save()
                        isPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text("Please fill all fields and check due date"))
            }
        }
    }
}

#Preview {
    NewItemView(isPresented: Binding(get: {
        return true
    }, set: {_ in
        
    }))
}
