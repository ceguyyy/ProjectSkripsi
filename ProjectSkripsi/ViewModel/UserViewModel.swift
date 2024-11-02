//
//  UserViewModel.swift
//  ProjectSkripsi
//
//  Created by Christian Gunawan on 02/11/24.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var currentUser: UserModel?
    @Published var isAuthenticated = false

    
    func login(email: String, password: String) {
        // Use mock data for authentication
        if let user = MockUserData.users.first(where: { $0.email == email && $0.password == password }) {
            currentUser = user
            isAuthenticated = true
        } else {
            isAuthenticated = false
        }
    }
    
    func signUp(name: String, email: String, password: String, phone: String, address: String) {
        // Normally, you would add this to a backend. Here, we'll just update the current user.
        let newUser = UserModel(name: name, email: email, password: password, role: "User", phone: phone, address: address)
        currentUser = newUser
        isAuthenticated = true
    }
}
