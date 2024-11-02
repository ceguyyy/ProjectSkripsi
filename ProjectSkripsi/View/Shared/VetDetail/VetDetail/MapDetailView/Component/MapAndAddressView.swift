//
//  MapAndAddressView.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 30/10/24.
//

import SwiftUI

struct MapAndAddressComponent: View {
    var vet: VetModel
    
    var body: some View {
        VStack {
            if let latitude = Double(vet.latitude), let longitude = Double(vet.longitude) {
                MapComponent(latitude: latitude, longitude: longitude)
                    .frame(width:361,height: 200)
                    .padding(.horizontal)
                    .cornerRadius(10)
            } else {
                Text("Invalid coordinates")
                    .foregroundColor(.red)
                    .padding()
            }
            
            Text(vet.address)
                .padding(.horizontal)
        }
    }
}

struct MapAndAddressComponent_Previews: PreviewProvider {
    static var previews: some View {
        let sampleVet = VetModel(
            imageName: "dog",
            vetName: "Happy Paws Vet Clinic",
            rating: 5,
            range: 2.5,
            closingTime: "6 PM",
            address: "123 Pet Lane, Pet City",
            latitude: "-6.3020781",
            longitude: "106.6522981"
        )

        MapAndAddressComponent(vet: sampleVet)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

