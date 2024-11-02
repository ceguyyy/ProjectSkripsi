//
//  DoctorModel.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 29/10/24.
//

import Foundation

struct DoctorModel: Identifiable {
    var id = UUID()
    var imageName: String
    var name: String
    var specialization: String
    var rating: Int
    var phoneNumber: String
    var vet: String
}
