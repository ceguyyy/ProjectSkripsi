//
//  Segment.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 30/10/24.
//


enum DetailEnum: String, CaseIterable, Identifiable {
    case appointment = "Appointment"
    case information = "Information"
    
    var id: String { self.rawValue }
}
