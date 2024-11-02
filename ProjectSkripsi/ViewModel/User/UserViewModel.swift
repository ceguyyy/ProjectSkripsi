//
//  UserViewModel.swift
//  VetHereiOSSkripsi
//
//  Created by Christian Gunawan on 31/10/24.
//

import SwiftUI
import Foundation

class UserViewModel: ObservableObject {
    @Published var users: [UserModel] = []
    
    init() {
        loadMockData()
    }
    
    // Load mock data
    private func loadMockData() {
        users = [
            UserModel(name: "Alice Johnson", email: "alice@example.com", password: "password123", role: "Admin", phone: "123456789", address: "123 Elm Street"),
            UserModel(name: "Bob Smith", email: "bob@example.com", password: "password123", role: "User", phone: "987654321", address: "456 Oak Avenue"),
            UserModel(name: "Charlie Brown", email: "charlie@example.com", password: "password123", role: "User", phone: "555123456", address: "789 Pine Road")
        ]
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
