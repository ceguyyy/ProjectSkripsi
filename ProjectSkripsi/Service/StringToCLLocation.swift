//
//  StringToCLLocation.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 30/10/24.
//


import CoreLocation

func locationDegrees(from string: String) -> CLLocationDegrees? {
    if let doubleValue = Double(string) {
        return CLLocationDegrees(doubleValue)
    } else {
        fatalError("Convert string to CLLocationDegrees failed")
        return nil
    }
}
