//
//  SwiftUIView.swift
//  ProjectSkripsi
//
//  Created by Christian Gunawan on 02/11/24.
//


import SwiftUI

struct ProfileView: View {
    var user: UserModel
    
    var body: some View {
        VStack {
            Text("Hello, \(user.name)!")
                .font(.largeTitle)
            Text("Email: \(user.email)")
            Text("Role: \(user.role)")
            Text("Phone: \(user.phone)")
            Text("Address: \(user.address)")
        }
        .padding()
    }
}

#Preview {
    let user = UserModel(name: "Alice Johnson", email: "Alice@example.com", password: "password123", role: "Admin", phone: "123456789", address: "123 Elm Street")
    
    ProfileView(user: user)
}
