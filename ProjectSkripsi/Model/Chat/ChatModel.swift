//
//  ChatModel.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 30/10/24.
//

import Foundation

struct ChatModel: Identifiable {
    var id = UUID()
    var doctorName: String
    var phoneNumber: String
    var timestamp: Date
    var image: String
    
}
