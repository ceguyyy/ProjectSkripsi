//
//  MedicalHistoryModel.swift
//  VetHereiOSSkripsi
//
//  Created by Christian Gunawan on 31/10/24.
//

import SwiftUI
import Combine

struct MedicalHistoryModel: Identifiable {
    var id = UUID()
    var tittle: String
    var description: String
    var date: Date
    var image: String
    var diagnosis: String
    var treatment: String
    var petName: String
}
