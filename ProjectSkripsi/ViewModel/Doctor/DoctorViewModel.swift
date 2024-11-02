import Foundation
import Combine

class DoctorViewModel: ObservableObject {
    @Published var doctors: [DoctorModel] = []
    @Published var selectedDoctor: DoctorModel?
    
    // Sample data for demonstration purposes
    private var allDoctors: [DoctorModel] = [
        DoctorModel(imageName: "dog", name: "Dr. John Doe", specialization: "Veterinarian", rating: 4, phoneNumber: "123-456-7890", vet: "Happy Paws"),
        DoctorModel(imageName: "cat", name: "Dr. Jane Smith", specialization: "Veterinarian", rating: 5, phoneNumber: "987-654-3210", vet: "Happy Paws"),
        DoctorModel(imageName: "bird", name: "Dr. Emily Davis", specialization: "Veterinarian", rating: 3, phoneNumber: "456-789-0123", vet: "Paw Health"),
        // Add more sample doctors here as needed
    ]
    
    init() {
        self.doctors = allDoctors // Initially load all doctors
    }
    
    func filterDoctors(by vetName: String) {
        // Filter doctors based on the vet name
        doctors = allDoctors.filter { $0.vet == vetName }
    }
    
    func selectDoctor(_ doctor: DoctorModel) {
        // Set the selected doctor
        selectedDoctor = doctor
    }
    
    func clearSelectedDoctor() {
        // Clear the selected doctor
        selectedDoctor = nil
    }
}
