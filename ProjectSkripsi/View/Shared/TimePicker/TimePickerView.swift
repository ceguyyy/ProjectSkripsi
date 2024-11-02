//
//  TimePickerView.swift
//  ProjectSkripsi
//
//  Created by Christian Gunawan on 02/11/24.
//


import SwiftUI

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

struct TimePickerView_Previews: PreviewProvider {
    @State static var selectedTime = Date()
    @State static var isPresented = true

    static var previews: some View {
        TimePickerView(selectedTime: $selectedTime, isPresented: $isPresented)
            .padding() // Optional padding for the preview
    }
}
