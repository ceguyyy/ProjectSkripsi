//
//  DetailView.swift
//  ProjectSkripsi
//
//  Created by Christian Gunawan on 02/11/24.
//

import SwiftUI

struct DetailView: View {
    var vet: VetModel // Ensure your Vet model is defined properly

    var body: some View {
        VStack {
            Text(vet.vetName) // Assuming 'name' is a property of your Vet model
                .font(.largeTitle)
                .padding()

            // Add more properties to display
            Text("Specialization: \(vet.range)") // Example property
                .font(.subheadline)
                .padding()

            Text("Contact: \(vet.rating)") // Example property
                .font(.subheadline)
                .padding()

            Spacer()
        }
        .padding()
    }
}
