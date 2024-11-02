import SwiftUI

struct ChooseScheduleView: View {
    var pet: PetModel
    var doctor: DoctorModel
    var user: UserModel
    
    @State private var selectedDate: Date = Date()
    @State private var selectedTime: Date = Date()
    @EnvironmentObject var appRouter: AppRouter
    @State private var showTimePicker: Bool = false

    var body: some View {
        NavigationStack {
            List {
                DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
            
                Button(action: {
                    showTimePicker.toggle()
                }) {
                    HStack {
                        Text("Time").font(.headline).foregroundColor(Color.black)
                        Spacer()
                        Text("\(formattedTime(selectedTime))")
                            .font(.headline)
                            .foregroundColor(Color.black)
                            .padding()
                            .background(Color.gray)
                            .cornerRadius(8)
                    }
                }
            
                HStack {
                    Text("Selected Pet: \(pet.name)")
                }
                NavigationLink(destination: NotesView(selectedPet: pet, doctor: doctor, selectedDate: selectedDate, selectedTime: selectedTime, user: user).environmentObject(appRouter)){
                    Text("Next")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .navigationTitle("Choose Schedule")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        appRouter.goToBook(with: doctor, user: user)
                    }) {
                        Image(systemName: "chevron.left")
                    }
                }
            }
            .sheet(isPresented: $showTimePicker) {
                TimePickerView(selectedTime: $selectedTime, isPresented: $showTimePicker)
            }
        }
    }
    
    private func formattedTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
