//
//  Vet.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 22/10/24.
//


import Foundation
import MapKit

struct VetModel: Identifiable {
    let id = UUID()
    var imageName: String
    var vetName: String
    var rating: Int
    var range: Double
    var closingTime: String
    var address: String
    var latitude: String
    var longitude: String
    

}


