//
//  ProfileView.swift
//  ToDoList
//
//  Created by Ivan Bondaruk on 02/06/2025.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
               if let user = viewModel.user{
                   profileView(user: user)
                }
                else {
                    Text("Loading...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear() {
            viewModel.fetchUser()
        }
    }
}

@ViewBuilder
func profileView(user:User) -> some View {
    InitialsAvatarView(fullName: user.fullName, diameter: 100)
    
    VStack(alignment: .leading) {
        Text(user.fullName)
            .bold()
        Text(user.email)
        
        Text("Joined \(Date(timeIntervalSince1970: user.joinedAt).formatted(date: .abbreviated, time: .shortened))")
    }
    
    Button("Logout") {
        
    }
    .tint(.red)
    .padding()
    
    Spacer()
}

#Preview {
    ProfileView()
}
