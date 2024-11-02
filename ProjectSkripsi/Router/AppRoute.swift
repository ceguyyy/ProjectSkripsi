//
//  LoginRoute.swift
//  ProjectSkripsi
//
//  Created by Christian Gunawan on 02/11/24.
//


import Foundation
import SwiftUI

enum AppRoute {
    case login
    case home
    case detail(VetModel, UserModel)
    case book(DoctorModel, UserModel)
    case schedule(UserModel, DoctorModel, PetModel)
    case notes(UserModel, DoctorModel, PetModel, Date, Date)
    case summary(UserModel,DoctorModel, PetModel,  Date, Date, String)
    case profile(UserModel)
   
    
}


class AppRouter: ObservableObject {
    @StateObject var appRouter = AppRouter()
    @Published var currentRoute: AppRoute = .login
    
    func goToHome() {
       
        currentRoute = .home
    }
    
    func goToLogin() {
        currentRoute = .login
    }
    
    func goToDetail(with vet: VetModel, user:UserModel) {
        currentRoute = .detail(vet, user)
    }
    func goToBook(with doctor: DoctorModel, user: UserModel) {
        currentRoute = .book(doctor, user)
    }
    
    func goToChooseSchedule(with doctor: DoctorModel, user: UserModel, pet: PetModel) {
        currentRoute = .schedule(user, doctor, pet)
        }
    
    
    func goToNotesView(with user:UserModel, pet: PetModel, doctor: DoctorModel, selectedDate: Date, selectedTime: Date) {
        currentRoute = .notes(user, doctor, pet, selectedDate, selectedTime)
    }
        
    
    func goToSummary(with user:UserModel, selectedDoctor: DoctorModel, selectedPet: PetModel, selectedDate: Date, selectedTime: Date, inputText: String) {
        currentRoute = .summary(user, selectedDoctor, selectedPet, selectedDate, selectedTime, inputText)
        }
    
    func goToProfile(with currentUser: UserModel) {
        currentRoute = .profile(currentUser)
        
    }
    
    
    
}

