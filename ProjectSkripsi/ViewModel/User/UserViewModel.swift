//
//  UserViewModel.swift
//  ProjectSkripsi
//
//  Created by Christian Gunawan on 02/11/24.
//

import SwiftUI
import Foundation

class UserViewModel: ObservableObject {
    @Published var users: [UserModel] = []
    @Published var currentUser: UserModel?
    @Published var isAuthenticated = false
    
    init() {
        currentUser = UserModel(name: "John Doe", email: "johndoe@example.com", password: "password123", role: "User", phone: "123-456-7890", address: "123 Main St, Anytown, USA")
        loadMockData()
    }
    
    // Load mock data
    private func loadMockData() {
        users = [
            UserModel(name: "Alice Johnson", email: "Alice@example.com", password: "password123", role: "Admin", phone: "123456789", address: "123 Elm Street"),
            UserModel(name: "Bob Smith", email: "Bob@example.com", password: "password123", role: "User", phone: "987654321", address: "456 Oak Avenue"),
            UserModel(name: "Charlie Brown", email: "Charlie@example.com", password: "password123", role: "User", phone: "555123456", address: "789 Pine Road")
        ]
    }
    
    // Create new user and authenticate
    func signUp(name: String, email: String, password: String, phone: String, address: String) {
        guard !users.contains(where: { $0.email == email }) else {
            print("User already exists.")
            return // Handle user already exists case (you might want to set an error message)
        }
        
        let newUser = UserModel(name: name, email: email, password: password, role: "User", phone: phone, address: address)
        users.append(newUser)
        currentUser = newUser // Set the new user as the current user
        isAuthenticated = true // Automatically log in the new user
    }
    
    // Login user
    func login(email: String, password: String) -> Bool {
        if let user = users.first(where: { $0.email == email && $0.password == password }) {
            currentUser = user
            isAuthenticated = true
            return true
        } else {
            currentUser = nil
            isAuthenticated = false
            return false
        }
    }
    
    // Create new user
    func addUser(name: String, email: String, password: String, role: String, phone: String, address: String) {
        let newUser = UserModel(name: name, email: email, password: password, role: role, phone: phone, address: address)
        users.append(newUser)
    }
    
    // Read user by ID
    func getUserById(_ id: UUID) -> UserModel? {
        return users.first(where: { $0.id == id })
    }
    
    // Update user
    func updateUser(id: UUID, name: String? = nil, email: String? = nil, password: String? = nil, role: String? = nil, phone: String? = nil, address: String? = nil) {
        if let index = users.firstIndex(where: { $0.id == id }) {
            users[index].name = name ?? users[index].name
            users[index].email = email ?? users[index].email
            users[index].password = password ?? users[index].password
            users[index].role = role ?? users[index].role
            users[index].phone = phone ?? users[index].phone
            users[index].address = address ?? users[index].address
        }
    }
    
    // Delete user
    func deleteUser(id: UUID) {
        users.removeAll { $0.id == id }
    }
}
