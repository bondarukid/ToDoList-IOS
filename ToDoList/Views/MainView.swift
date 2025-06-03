//
//  ContentView.swift
//  ToDoList
//
//  Created by Ivan Bondaruk on 02/06/2025.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            accountView
        } else{
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView{
            ToDoListView(userID: viewModel.currentUserId)
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            
            ProfileView()
                .tabItem{
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    MainView()
}
