//
//  HomeView.swift
//  ProjectSkripsi
//
//  Created by Christian Gunawan on 02/11/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var vetViewModel: VetViewModel

    var body: some View {
            NavigationView { // Ensure there's a NavigationView
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(vetViewModel.filteredVets) { vet in
                            NavigationLink(destination: DetailView(vet: vet)) { // Link to DetailView
                                VetCardComponent(vet: vet)
                            }
                            .buttonStyle(PlainButtonStyle()) // Optional: Remove default button style
                        }
                    }
                    .padding()
                }
                .navigationTitle("Nearby Vets")
                .searchable(text: $vetViewModel.searchText, prompt: "Search for vets")
                .padding(.horizontal)
            }
        }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let mockViewModel = UserViewModel()
        mockViewModel.currentUser = UserModel(name: "John Doe", email: "johndoe@example.com", password: "password123", role: "User", phone: "123-456-7890", address: "123 Main St, Anytown, USA")

        let vetViewModel = VetViewModel()
        return HomeView()
            .environmentObject(mockViewModel)
            .environmentObject(vetViewModel)
    }
}
