//
//  NotesView.swift
//  ProjectSkripsi
//
//  Created by Christian Gunawan on 02/11/24.
//

import SwiftUI

struct NotesView: View {
    @EnvironmentObject var appRouter: AppRouter
    var selectedPet: PetModel
    var doctor: DoctorModel
    var selectedDate: Date
    var selectedTime: Date
    var user: UserModel
    @State private var inputText: String = ""
    
    var body: some View {
        List {
            Text("Pet Complaints or Diseases")
            TextField("Enter notes", text: $inputText)
                .textFieldStyle(PlainTextFieldStyle())
                .padding()
                .frame(height: 300)
                .background(Color.white)
                .cornerRadius(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 1)
                )
            Text("Selected Pet: \(selectedPet.name)")
            Text("Doctor: \(doctor.name)")
            NavigationLink(destination: SummaryView(selectedDoctor: doctor, selectedPet: selectedPet, selectedDate: selectedDate, selectedTime: selectedTime, inputText: inputText).environmentObject(appRouter)) {
                Text("Next")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .navigationTitle("Notes")
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        let samplePet = PetModel(
            imageName: "petImage",
            name: "Buddy",
            weight: 25.0,
            type: "Dog",
            DOB: Date(),
            breed: "Golden Retriever",
            color: "Golden",
            owner: "Christian Gunawan"
        )
        
        // Sample dates for preview
        let sampleDate = Date() // Current date
        let sampleTime = Calendar.current.date(byAdding: .hour, value: 2, to: Date()) ?? Date() // Current time + 2 hours
        
        let sampleDoctor = DoctorModel(imageName: "dog", name: "Dr. John Doe", specialization: "Veterinarian", rating: 4, phoneNumber: "123-456-7890", vet: "Vet Clinic")
        
        let sampleUser = UserModel(
            name: "John Doe", email: "johndoe@example.com", password: "password123", role: "User",
            phone: "123-456-7890", address: "123 Main St, Anytown, USA")

        NotesView( selectedPet: samplePet, doctor: sampleDoctor, selectedDate: sampleDate, selectedTime: sampleTime, user: sampleUser)
    }
}
