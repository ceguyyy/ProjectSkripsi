//
//  WhatsAppLink.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 30/10/24.
//



import SwiftUI
import UIKit

func openWhatsApp(phoneNumber: String, message: String) {
    let encodedMessage = message.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    
    let urlString = "https://wa.me/\(phoneNumber)?text=Hallo \(message), saya membutuhkan bantuan anda (This text was generated from VetHere)"
    
    if let url = URL(string: urlString) {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            print("WhatsApp is not installed.")
        }
    }
}

