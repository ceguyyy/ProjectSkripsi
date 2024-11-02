import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appRouter: AppRouter
    @EnvironmentObject var vetViewModel: VetViewModel
    @EnvironmentObject var doctorViewModel: DoctorViewModel
    @EnvironmentObject var bookViewModel: BookViewModel
    
    var body: some View {
        
        switch appRouter.currentRoute {
        case .login:
            LoginView()
        case .home:
            HomeView(router: appRouter)
        case .detail(let vet, let user):
            DetailView(vet: vet, user: user)
        case .book(let doctor, let user):
            Book(appRouter: appRouter, doctor: doctor, user: user)
        case .schedule(let user, let doctor, let pet):
            ChooseScheduleView(pet: pet, doctor: doctor, user: user)
        case .notes(let user, let selectedDoctor, let selectedPet, let selectedDate, let selectedTime):
            NotesView(selectedPet: selectedPet, doctor: selectedDoctor, selectedDate: selectedDate, selectedTime: selectedTime, user: user)
            
        case .summary(_, let selectedDoctor, let selectedPet, let selectedDate, let selectedTime, let inputText):
            SummaryView(selectedDoctor: selectedDoctor, selectedPet: selectedPet, selectedDate: selectedDate, selectedTime: selectedTime, inputText: inputText)
        case .profile(let user):
            ProfileView(user: user)
        }
    }
}

#Preview {
    ContentView()
}
