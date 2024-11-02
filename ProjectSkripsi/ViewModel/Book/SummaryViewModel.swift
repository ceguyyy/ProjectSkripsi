// SummaryViewModel.swift
// ProjectSkripsi
// Created by Christian Gunawan on 02/11/24.

import Foundation

class SummaryViewModel: ObservableObject {
    @Published var isSaved: Bool = false
    @Published var bookingSummary: BookSummaryModel?
    
    func saveBooking(selectedDoctor: DoctorModel, selectedPet: PetModel, selectedDate: Date, selectedTime: Date, inputText: String) {
        let newBooking = BookSummaryModel(
            id: Int(Date().timeIntervalSince1970),
            date: selectedDate,
            time: DateFormatter.localizedString(from: selectedTime, dateStyle: .none, timeStyle: .short),
            doctor: selectedDoctor.name,
            petName: selectedPet.name,
            notes: inputText.isEmpty ? "No notes provided" : inputText
        )
        
        // Here, you can implement your actual saving logic
        bookingSummary = newBooking
        isSaved = true
        
        print("Booking saved:", newBooking) // Replace with actual save logic
    }
}
