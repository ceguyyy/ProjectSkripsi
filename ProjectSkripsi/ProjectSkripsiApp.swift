//
//  ProjectSkripsiApp.swift
//  ProjectSkripsi
//
//  Created by Christian Gunawan on 01/11/24.
//

import SwiftUI

@main
struct VetHereiOSSkripsiApp: App {
    @StateObject private var appRouter = AppRouter()
    @StateObject private var userViewModel = UserViewModel()
    @StateObject private var vetViewModel = VetViewModel()
    @StateObject private var doctorViewModel = DoctorViewModel()
    @StateObject private var bookViewModel = BookViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(userViewModel)
                    .environmentObject(appRouter)
                    .environmentObject(vetViewModel)
                    .environmentObject(doctorViewModel)
                    .environmentObject(bookViewModel)
            }
        }
    }
}
