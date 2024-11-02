import SwiftUI
import Combine

class BookViewModel: ObservableObject {
    @Published var doctor: DoctorModel
    @Published var user: UserModel
    @Published var pets: [PetModel]
    
    // Computed property to filter pets based on the owner's name
    var filteredPets: [PetModel] {
        pets.filter { $0.owner == user.name }
    }

    init(doctor: DoctorModel, user: UserModel, pets: [PetModel]) {
        self.doctor = doctor
        self.user = user
        self.pets = pets
    }
    
    // Function to handle booking an appointment for a specific pet
    func bookAppointment(for pet: PetModel) {
        print("Booking appointment for \(pet.name) with \(doctor.name)")
        // Implement your booking logic here (e.g., network call)
    }
}
