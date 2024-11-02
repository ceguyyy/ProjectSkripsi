//
//  LoginRoute.swift
//  ProjectSkripsi
//
//  Created by Christian Gunawan on 02/11/24.
//


import Foundation

enum AppRoute {
    case login
    case home
    case detail
}

class AppRouter: ObservableObject {
    @Published var currentRoute: AppRoute = .login

    func goToHome() {
        currentRoute = .home
    }

    func goToLogin() {
        currentRoute = .login
    }
    
    func goToDetail() {
        currentRoute = .detail
    }
    
}

