//
//  TLButtonView.swift
//  ToDoList
//
//  Created by Ivan Bondaruk on 03/06/2025.
//

import SwiftUI

struct TLButtonView: View {
    
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
                    
            }
        }
    }
}

#Preview {
    TLButtonView(title: "Title", backgroundColor: .green) {
        // Logic here
    }
}
