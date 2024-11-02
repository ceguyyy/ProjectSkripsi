import SwiftUI

struct SummaryView: View {
    var selectedDoctor: DoctorModel
    var selectedPet: PetModel
    var selectedDate: Date
    var selectedTime: Date
    var inputText: String
    
    @EnvironmentObject var appRouter: AppRouter
    @Environment(\.presentationMode) var presentationMode // Add this line
    
    @StateObject private var viewModel = SummaryViewModel()
    
    var body: some View {

            VStack(alignment: .leading) {
                VStack {
                    Text("Booking Summary")
                        .font(.title)
                        .bold()
                }
                
                Divider()
                HStack {
                    Text("Date:")
                        .bold()
                    Spacer()
                    Text(formattedDate(selectedDate))
                }.padding(.top)
                
                HStack {
                    Text("Time:")
                        .bold()
                    Spacer()
                    Text(formattedTime(selectedTime))
                }.padding(.bottom)
                
                Divider()

                HStack {
                    Text("Doctor Name:")
                        .bold()
                    Spacer()
                    Text(selectedDoctor.name)
                }.padding(.top)
                
                // Pet Name
                HStack {
                    Text("Pet Name:")
                        .bold()
                    Spacer()
                    Text(selectedPet.name)
                }.padding(.bottom)
                
                Divider()
                // Pet Type
                HStack {
                    Text("Pet Type:")
                        .bold()
                    Spacer()
                    Text(selectedPet.type)
                }.padding(.vertical)
                
                Divider()
                // Notes
                VStack(alignment: .leading) {
                    Text("Notes:")
                        .bold()
                    Spacer()
                    Text(inputText.isEmpty ? "No notes provided" : inputText)
                        .foregroundColor(inputText.isEmpty ? .gray : .primary)
                }
                .padding(.top)

                Spacer()
                
                // Save Button
                Button(action: {
                    viewModel.saveBooking(selectedDoctor: selectedDoctor, selectedPet: selectedPet, selectedDate: selectedDate, selectedTime: selectedTime, inputText: inputText)
                    
                    appRouter.goToHome()
                    

                }) {
                    Text("Save Booking")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                
                .padding(.top)
                
                if viewModel.isSaved {
                    Text("Booking saved successfully!")
                        .foregroundColor(.green)
                        .padding(.top)
                }
            }
            .padding()
        }
    
    private func formattedTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        let samplePet = PetModel(
            imageName: "petImage",
            name: "Buddy",
            weight: 25.0,
            type: "Dog",
            DOB: Date(),
            breed: "Golden Retriever",
            color: "Golden",
            owner: "Christian Gunawan"
        )
        
        let sampleDate = Date()
        let sampleTime = Calendar.current.date(byAdding: .hour, value: 2, to: Date()) ?? Date()
        let sampleNotes = "Buddy has been feeling lethargic and not eating well."
        
        let sampleDoctor = DoctorModel(imageName: "dog", name: "Dr. John Doe", specialization: "Veterinarian", rating: 4, phoneNumber: "123-456-7890", vet: "Vet Clinic")
        
        SummaryView(selectedDoctor: sampleDoctor, selectedPet: samplePet, selectedDate: sampleDate, selectedTime: sampleTime, inputText: sampleNotes)
    }
}
