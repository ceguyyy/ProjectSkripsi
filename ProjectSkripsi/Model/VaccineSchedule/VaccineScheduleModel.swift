//
//  VaccineSchedule.swift
//  VetHereiOSSkripsi
//
//  Created by Christian Gunawan on 31/10/24.
//

import SwiftUI
import Combine

struct VaccineScheduleModel:Identifiable {
    var id = UUID()
    var name:String
    var date:Date
    var doctor:String
    var repeats: String
    var petName:String
    
}
