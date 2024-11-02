//
//  UserModel.swift
//  VetHereiOSSkripsi
//
//  Created by Christian Gunawan on 31/10/24.
//

import SwiftUI
import Foundation

struct UserModel: Identifiable {
    var id = UUID()
    var name: String
    var email: String
    var password: String
    var role: String
    var phone: String
    var address: String
    
}

