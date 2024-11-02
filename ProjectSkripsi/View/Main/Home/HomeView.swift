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
    @StateObject var router: AppRouter
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(vetViewModel.filteredVets) { vet in
                        NavigationLink(destination: DetailView(vet: vet, user: userViewModel.currentUser ?? UserModel(
                            name: "Guest",
                            email: "",
                            password: "",
                            role: "Guest",
                            phone: "",
                            address: ""
                        )).environmentObject(router)) {
                            VetCardComponent(vet: vet)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
            .navigationTitle("Nearby Vets")
            .searchable(text: $vetViewModel.searchText, prompt: "Search for vets")
            .padding(.horizontal)
            .navigationBarItems(
                trailing:
                    NavigationLink(
                        destination: ProfileView(
                            user: userViewModel.currentUser ?? UserModel(
                                name: "Guest", email: "", password: "", role: "Guest", phone: "", address: "")
                        )
                    ) {
                        Image(systemName: "person.fill")
                            .imageScale(.large)
                            .foregroundColor(.blue)
                    }
            )
        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        let mockViewModel = UserViewModel()
//        mockViewModel.currentUser = UserModel(
//            name: "John Doe", email: "johndoe@example.com", password: "password123", role: "User",
//            phone: "123-456-7890", address: "123 Main St, Anytown, USA")
//        
//        let vetViewModel = VetViewModel()
//        return HomeView(, router: route())
//            .environmentObject(mockViewModel)
//            .environmentObject(vetViewModel)
//    }
//}
