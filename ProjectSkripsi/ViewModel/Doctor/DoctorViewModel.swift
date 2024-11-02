//
//  DoctorViewModel.swift
//  ProjectSkripsi
//
//  Created by Christian Gunawan on 02/11/24.
//


import Foundation
import Combine

class DoctorViewModel: ObservableObject {
    @Published var doctors: [DoctorModel] = []
    @Published var selectedDoctor: DoctorModel?
    
    private var allDoctors: [DoctorModel] = [
        DoctorModel(imageName: "dog", name: "Dr. John Doe", specialization: "Veterinarian", rating: 4, phoneNumber: "123-456-7890", vet: "Happy Paws"),
        DoctorModel(imageName: "cat", name: "Dr. Jane Smith", specialization: "Veterinarian", rating: 5, phoneNumber: "987-654-3210", vet: "Happy Paws"),
        DoctorModel(imageName: "bird", name: "Dr. Emily Davis", specialization: "Veterinarian", rating: 3, phoneNumber: "456-789-0123", vet: "Happy Paws"),
        DoctorModel(imageName: "bird", name: "Dr. cg", specialization: "Veterinarian", rating: 3, phoneNumber: "456-789-0123", vet: "Paws & Claws Animal Hospital")
    ]
    
    init() {
        self.doctors = allDoctors
    }
    
    func filterDoctors(by vetName: String) {
        doctors = allDoctors.filter { $0.vet == vetName }
    }
    
    func selectDoctor(_ doctor: DoctorModel) {
        selectedDoctor = doctor
    }
    
    func clearSelectedDoctor() {
        selectedDoctor = nil
    }
}
