//
//  DoctorListComponent.swift
//  ProjectSkripsi
//
//  Created by Christian Gunawan on 02/11/24.
//

import SwiftUI

struct DoctorListComponent: View {
    @EnvironmentObject var router: AppRouter
    @EnvironmentObject var doctorViewModel: DoctorViewModel
    @EnvironmentObject var bookViewModel: BookViewModel
    
    var doctor: DoctorModel
    var user: UserModel
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Image("\(doctor.imageName)")
                    .resizable()
                    .frame(width: 88, height: 88)
                    .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(doctor.name)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text(doctor.specialization)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    HStack(spacing: 2) {
                        ForEach(0..<doctor.rating, id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .font(.system(size: 12))
                        }
                    }
                }
                Spacer()
                
                VStack(alignment: .trailing) {
                    Button(action: {
                        openWhatsApp(phoneNumber: "\(doctor.phoneNumber)", message: "\(doctor.name)")
                    }) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(Color.gray)
                                .frame(width: 60, height: 24)
                                .cornerRadius(10)
                            
                            Text("Chat")
                                .foregroundColor(.white)
                                .font(.system(size: 14))
                        }
                    }
                    
                    NavigationLink(destination: Book(appRouter: router, doctor: doctor, user: user).environmentObject(router)) {
                                         ZStack {
                                             Rectangle()
                                                 .foregroundColor(Color.gray)
                                                 .frame(width: 60, height: 24)
                                                 .cornerRadius(10)
                                             
                                             Text("Book")
                                                 .foregroundColor(.white)
                                                 .font(.system(size: 14))
                                         }
                                     }
                                 }
                                 .padding(22)
                             }
            .frame(width: 361, height: 88)
            .background(Color("ColorCard"))
            .cornerRadius(4)
            .padding(4)
        }
    }
}
//
//#Preview {
//    let sampleUser = UserModel(
//        name: "John Doe", email: "johndoe@example.com", password: "password123", role: "User",
//        phone: "123-456-7890", address: "123 Main St, Anytown, USA")
//    
//    let sampleDoctor = DoctorModel(imageName: "dog", name: "Dr. John Doe", specialization: "Veterinarian", rating: 4, phoneNumber: "123-456-7890", vet: "Vet Clinic")
//    
//    // Provide environment objects for preview
//    let appRouter = AppRouter()
//    let doctorViewModel = DoctorViewModel() // Assume you have a proper initializer
//    let bookViewModel = BookViewModel() // Assume you have a proper initializer
//
//    DoctorListComponent(router: AppRouter(), doctor: sampleDoctor, user: sampleUser)
//        .environmentObject(appRouter) // Inject the AppRouter
//        .environmentObject(doctorViewModel) // Inject the DoctorViewModel
//        .environmentObject(bookViewModel) // Inject the BookViewModel
//}
