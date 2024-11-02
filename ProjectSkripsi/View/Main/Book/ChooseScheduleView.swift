struct ChooseScheduleView: View {
    var selectedPet: PetModel? // Accept selected pet as a parameter
    
    var body: some View {
        VStack {
            if let pet = selectedPet {
                Text("Selected Pet: \(pet.name)")
            } else {
                Text("No pet selected")
            }
        }
        .navigationTitle("Choose Schedule")
    }
}