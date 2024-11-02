//
//  Book.swift
//  ProjectSkripsi
//
//  Created by Christian Gunawan on 02/11/24.
//
import SwiftUI

struct Book: View {
    @StateObject var viewModel = BookViewModel()
    @ObservedObject var appRouter: AppRouter
    @State private var selectedPet: PetModel?
    var doctor: DoctorModel
    var user: UserModel
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section(header: Text("My Pets")) {
                        if viewModel.filteredPets.isEmpty {
                            Text("No pets available")
                                .foregroundColor(.gray)
                        } else {
                            ForEach(viewModel.filteredPets) { pet in
                                HStack {
                                    Image(pet.imageName)
                                        .resizable()
                                        .frame(width: 36, height: 36)
                                        .clipShape(Circle())
                                    VStack(alignment: .leading) {
                                        Text(pet.name)
                                        Text(pet.type)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                    Spacer()
                                    Button(action: {
                                        print("Booked: \(pet.name)")
                                        selectedPet = pet
                                    }) {
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                        }
                    }
                    Section {
                        HStack {
                            Spacer()
                            Button(action: {
                                print("New Pet")
                            }) {
                                VStack(alignment: .center) {
                                    Text("New Pet")
                                        .font(.headline)
                                        .foregroundColor(.accentColor)
                                        .padding()
                                        .background(Color.white)
                                        .cornerRadius(10)
                                }
                            }
                            Spacer()
                        }
                    }
                    Section {
                        HStack {
                            Spacer()
                            if let selectedPet = selectedPet {
                                Button(action: {
                                    appRouter.goToChooseSchedule(with: doctor, user: user, pet: selectedPet)
                                }) {
                                    Text("Next")
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .padding()
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                }
                            } else {
                                Text("Choose Pet")
                                    .font(.headline)
                                    .foregroundColor(.accentColor)
                                    .padding()
                                    .background(Color.clear)
                                    .cornerRadius(10)
                            }
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Book a Visit")
            .onAppear {
                viewModel.ownerName = user.name
            }
        }
    }
}

#Preview {
    let sampleUser = UserModel(
        name: "John Doe", email: "johndoe@example.com", password: "password123", role: "User",
        phone: "123-456-7890", address: "123 Main St, Anytown, USA"
    )
    
    let sampleDoctor = DoctorModel(
        imageName: "dog", name: "Dr. John Doe", specialization: "Veterinarian", rating: 4,
        phoneNumber: "123-456-7890", vet: "Vet Clinic"
    )
    
    NavigationStack {
        Book(appRouter: AppRouter(), doctor: sampleDoctor, user: sampleUser)
    }
}
