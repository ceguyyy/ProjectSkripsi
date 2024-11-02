//
//  VetCardComponent.swift
//  ProjectSkripsi
//
//  Created by Christian Gunawan on 02/11/24.
//

import SwiftUI

struct VetCardComponent: View {
    var vet: VetModel
    var body: some View {
        VStack(alignment: .leading) {
            Image(vet.imageName)
                .resizable()
                .frame(width: 361, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            VStack(alignment: .leading,spacing: 8){
                Text(vet.vetName)

                    .padding(.bottom, 2)
                    .font(.system(size: 22, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color("TextColor"))
                
                HStack(spacing: 2) {
                    ForEach(0..<vet.rating, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.system(size: 12))
                    }
                    
                    Text("•")
                        .foregroundColor(.gray)
                        .font(.system(size: 12))
                    
                    HStack {
                        Image(systemName: "map.fill")
                        Text("\(vet.range, specifier: "%.1f") Km")
                            .font(.system(size: 12))
                            .foregroundColor(Color("TextColor"))
                    }
                    Text("•")
                        .foregroundColor(.gray)
                        .font(.system(size: 12))
                    
                    HStack {
                        Image(systemName: "clock.fill")
                        Text("Until \(vet.closingTime)")
                            .font(.system(size: 12))
                            .foregroundColor(Color("TextColor"))
                    }
                }
                Text(vet.address)
                    .font(.system(size: 13))
                    .foregroundColor(.black)
                    .foregroundColor(Color("TextColor"))
                    .lineLimit(2)
                   
            }
            .padding(12)
            
        }
        .padding(.bottom)
        .foregroundColor(Color("TextColor"))
        .background(Color("ColorCard"))
        .frame(width: 361)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .cornerRadius(10)

    }
}


struct VetCardComponent_Previews: PreviewProvider {
    static var previews: some View {
        let sampleVet = VetModel(
            imageName: "dog", // Ensure this image exists in your assets
            vetName: "Happy Paws",
            rating: 5,
            range: 5.6,
            closingTime: "5 PM",
            address: "123 Vet St, Pet City",
            latitude: "1",
            longitude: "1"
        )
        
        // Create a VetCardComponent with the sampleVet
        return VetCardComponent(vet: sampleVet)
            .preferredColorScheme(.light) // Optional: Set preferred color scheme
            .padding() // Add padding for better visual in preview
    }
}
