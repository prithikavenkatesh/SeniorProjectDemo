//
//  ContentView.swift
//  seniorprojectDemo4
//
//  Created by Prithika Venkatesh on 24/5/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var studentNumber: String = ""
    @State private var message: String = ""
    @State private var timestamp: String = ""
    
    // Student data dictionary
    private let studentData: [String: (number: String, name: String, grade: String)] = [
        "241041": ("241041", "Prithika Venkatesh", "Grade 12"),
        "230000": ("230000", "Mia", "Grade 11"),
        "213123": ("213123", "Alina", "Grade 9"),
        "240890":("240890", "Daphne", "Grade 12"),
        "290926": ("290926", "Saanvika Venkatesh", "Grade 7"),
    ]
    
    var body: some View {
        ZStack {
            // Background color
            Color(red: 0.9, green: 0.9, blue: 0.9)
                .ignoresSafeArea()
            
            VStack {
                // Image at the top
                Image("logo2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                
                Spacer()
                
                VStack {
                    TextField("Enter student number", text: $studentNumber, onCommit: checkStudentNumber)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text(message)
                        .padding()
                    
                    Text(timestamp)
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .padding(.top, 8)
                }
                .background(Color.white)
                .padding(.horizontal, 20)
                .cornerRadius(10)
                
                Spacer()
            }
        }
    }
    
    func checkStudentNumber() {
        if let studentInfo = studentData[studentNumber] {
            let currentDate = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            timestamp = " \(dateFormatter.string(from: currentDate))"
            
            message = """
            Welcome,

            \(studentInfo.number), \(studentInfo.name), \(studentInfo.grade)

            Have a great day!
            """
        } else {
            message = "Invalid student number. Please try again."
            timestamp = ""
        }
        studentNumber = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
