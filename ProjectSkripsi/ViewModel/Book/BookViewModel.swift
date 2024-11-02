//
//  BookViewModel.swift
//  ProjectSkripsi
//
//  Created by Christian Gunawan on 02/11/24.
//

import Foundation
import Combine

class BookViewModel: ObservableObject {
    @Published var pets: [PetModel] = []
    @Published var filteredPets: [PetModel] = []
    var ownerName: String = "" {
        didSet {
            filterPets()
        }
    }

    init() {
        loadMockData()
    }

    func loadMockData() {
        pets = [
            PetModel(imageName: "dog", name: "Buddy", weight: 10.0, type: "Dog", DOB: Date(), breed: "Golden Retriever", color: "Golden", owner: "Alice Johnson"),
            PetModel(imageName: "cat", name: "Max", weight: 8.5, type: "Cat", DOB: Date(), breed: "Siamese", color: "Brown", owner: "Alice Johnson"),
            PetModel(imageName: "rabbit", name: "Charlie", weight: 3.0, type: "Rabbit", DOB: Date(), breed: nil, color: "White", owner: "Alice Johnson"),
            PetModel(imageName: "parrot", name: "Bella", weight: 0.5, type: "Parrot", DOB: Date(), breed: nil, color: "Green", owner: "Alice Johnson")
        ]
        filterPets()
    }

    private func filterPets() {
        filteredPets = pets.filter { $0.owner == ownerName }
    }
}
