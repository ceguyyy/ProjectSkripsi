//
//  PetModel.swift
//  VetHereiOSSkripsi
//
//  Created by Christian Gunawan on 31/10/24.
//

import SwiftUI
import Combine

struct PetModel: Identifiable {
    var id = UUID()
    var imageName: String
    var name: String
    var weight: Double
    var type: String
    var DOB: Date
    var breed: String?
    var color: String?
}
