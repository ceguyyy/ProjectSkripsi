struct TimePickerView: View {
    @Binding var selectedTime: Date
    @Binding var isPresented: Bool

    var body: some View {
        VStack {
            Text("Select Time")
                .font(.headline)
                .padding()

            DatePicker("Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                .datePickerStyle(WheelDatePickerStyle())
                .padding()

            Button("Done") {
                isPresented = false
            }
            .padding()
        }
    }
}
