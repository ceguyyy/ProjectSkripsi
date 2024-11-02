//
//  DetailView.swift
//  ProjectSkripsi
//
//  Created by Christian Gunawan on 02/11/24.
//
import SwiftUI

struct DetailView: View {
    var vet: VetModel
    var user: UserModel
    @StateObject private var doctorViewModel = DoctorViewModel()
    @State private var selectedSegment: DetailEnum = .appointment
    @EnvironmentObject var bookviewModel: BookViewModel
    @EnvironmentObject var router: AppRouter
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 4) {
                Image(vet.imageName)
                    .resizable()
                    .frame(height: 250)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(vet.vetName)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    Text("\(vet.range, specifier: "%.1f") Km away")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    
                    Text("Open until \(vet.closingTime)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                }
                
                Picker("Options", selection: $selectedSegment) {
                    ForEach(DetailEnum.allCases) { segment in
                        Text(segment.rawValue).tag(segment)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Group {
                    switch selectedSegment {
                    case .appointment:
                        ScrollView{
                            VStack(){
                                ForEach(doctorViewModel.doctors) { doctor in
                                    DoctorListComponent(doctor: doctor, user: user)
                                }
                                .onAppear {
                                    doctorViewModel.filterDoctors(by: vet.vetName)
                                }
                            }.padding(.horizontal)
                        }
                        
                    case .information:
                        ScrollView{
                            VStack(){
                                MapAndAddressComponent(vet: vet)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle(vet.vetName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let sampleVet = VetModel(
        imageName: "dog",  // Ensure this image exists in your assets
        vetName: "Happy Paws",
        rating: 5,
        range: 5.6,
        closingTime: "5 PM",
        address: "123 Vet St, Pet City",
        latitude: "1",
        longitude: "1"
    )
    
    let sampleUser = UserModel(
        name: "John Doe", email: "johndoe@example.com", password: "password123", role: "User",
        phone: "123-456-7890", address: "123 Main St, Anytown, USA")
    
    DetailView(vet: sampleVet, user: sampleUser)
}


