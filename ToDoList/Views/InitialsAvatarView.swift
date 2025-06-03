//
//  InitialsAvatarView.swift
//  ToDoList
//
//  Created by Ivan Bondaruk on 03/06/2025.
//

import SwiftUI

struct InitialsAvatarView: View {
    
    let fullName: String
    let diameter: Double
        
    private var initials: String {
        fullName
            .split(separator: " ")
            .compactMap { $0.first }
            .prefix(2)
            .map { String($0) }
            .joined()
            .uppercased()
        }
    
    var body: some View {
        Text(initials)
            .font(.system(size: diameter / 2.5, weight: .bold))
            .foregroundColor(.white)
            .frame(width: diameter, height: diameter)
            .background(Circle().fill(Color.gray))
    }
}

#Preview {
    InitialsAvatarView(fullName: "Ivan Bondaruk", diameter: 100)
}
