//  UserViewModel.swift
//  VetHereiOSSkripsi

import Foundation
import Combine

class UserViewModel: ObservableObject {
    @Published var currentUser: UserModel?
    @Published var isAuthenticated = false

    func login(email: String, password: String) {
        // Simulate login process (replace with actual authentication logic)
        if email == "test@example.com" && password == "password" {
            currentUser = UserModel(name: "Test User", email: email, password: password, role: "User", phone: "123456789", address: "123 Vet Street")
            isAuthenticated = true
        }
    }
    
    func signUp(name: String, email: String, password: String, phone: String, address: String) {
        // Simulate sign-up process
        currentUser = UserModel(name: name, email: email, password: password, role: "User", phone: phone, address: address)
        isAuthenticated = true
    }
}
