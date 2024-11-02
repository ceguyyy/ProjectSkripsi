//
//  LoginView.swift
//  VetHereiOSSkripsi
//
//  Created by Christian Gunawan on 02/11/24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewModel: UserViewModel
    @EnvironmentObject var router: AppRouter
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var name: String = ""
    @State private var phone: String = ""
    @State private var address: String = ""
    @State private var isSigningUp: Bool = false
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    var body: some View {
        VStack {
            if isSigningUp {
                Text("Register")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Phone", text: $phone)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Address", text: $address)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    if !name.isEmpty && !email.isEmpty && !password.isEmpty && !phone.isEmpty && !address.isEmpty {
                        viewModel.signUp(name: name, email: email, password: password, phone: phone, address: address)
                        if viewModel.isAuthenticated {
                            alertMessage = "Successfully signed up!"
                            showAlert = true
                            router.goToHome()
                        } else {
                            alertMessage = "Sign up failed. User might already exist."
                            showAlert = true
                        }
                    } else {
                        alertMessage = "Please fill in all fields."
                        showAlert = true
                    }
                }) {
                    Text("Sign Up")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                
                Button("Already have an account? Log In") {
                    isSigningUp.toggle()
                }
                .padding()
            } else {
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                // Login Fields
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    if viewModel.login(email: email, password: password) {
                        alertMessage = "Logged in successfully!"
                        showAlert = true
                        router.goToHome()
                    } else {
                        alertMessage = "Invalid email or password."
                        showAlert = true
                    }
                }) {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                
                Button("Don't have an account? Sign Up") {
                    isSigningUp.toggle()
                }
                .padding()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Alert"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
        .padding()
    }
}
#Preview {
    LoginView()
}
