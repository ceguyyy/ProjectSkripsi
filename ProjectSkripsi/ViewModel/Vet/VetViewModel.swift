//
//  VetViewModel.swift
//  VetHereiOSSkripsi
//
//  Created by Christian Gunawan on 01/11/24.
//




import Foundation
import MapKit

class VetViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var vets: [VetModel] = []
    
    init() {
        setup()
    }
    
    func setup() {
        loadMockData()
    }
    
    private func loadMockData() {
        vets = [
            VetModel(
                imageName: "dog",
                vetName: "Happy Paws Veterinary Clinic",
                rating: 5,
                range: 1.2,
                closingTime: "6:00 PM",
                address: "123 Pet St, Cityville",
                latitude: "37.7749",
                longitude: "-122.4194"
            ),
            VetModel(
                imageName: "dog",
                vetName: "Paws & Claws Animal Hospital",
                rating: 4,
                range: 2.5,
                closingTime: "7:30 PM",
                address: "456 Fur Ave, Pet Town",
                latitude: "34.0522",
                longitude: "-118.2437"
            ),
            VetModel(
                imageName: "dog",
                vetName: "Animal Care Center",
                rating: 3,
                range: 3.8,
                closingTime: "5:00 PM",
                address: "789 Whiskers Rd, Animal City",
                latitude: "40.7128",
                longitude: "-74.0060"
            ),
            VetModel(
                imageName: "dog",
                vetName: "Pets First Clinic",
                rating: 5,
                range: 4.2,
                closingTime: "8:00 PM",
                address: "321 Bark Ln, Pawsville",
                latitude: "34.0522",
                longitude: "-118.2437"
            ),
            VetModel(
                imageName: "dog",
                vetName: "The Vet House",
                rating: 4,
                range: 1.5,
                closingTime: "6:30 PM",
                address: "111 Paws Rd, Tail City",
                latitude: "36.7783",
                longitude: "-119.4179"
            )
        ]
    }
    
    var filteredVets: [VetModel] {
        if searchText.isEmpty {
            return vets
        } else {
            return vets.filter { vet in
                vet.vetName.lowercased().contains(searchText.lowercased())
            }
        }
    }
}
