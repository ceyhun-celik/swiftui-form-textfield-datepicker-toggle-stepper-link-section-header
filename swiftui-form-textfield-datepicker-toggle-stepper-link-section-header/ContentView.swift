//
//  ContentView.swift
//  swiftui-form-textfield-datepicker-toggle-stepper-link-section-header
//
//  Created by Ceyhun Çelik on 12.02.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var birthdate: Date = Date()
    @State private var sendNewsletter: Bool = false
    @State private var numberOfLikes: Int = 1
    
    var body: some View {
        NavigationView(content: {
            Form {
                Section(header: Text("Personal Information"), content: {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    DatePicker("Birthdate", selection: $birthdate, displayedComponents: .date)
                })

                Section(header: Text("Actions"), content: {
                    Toggle("Send Newsletter", isOn: $sendNewsletter)
                        .toggleStyle(SwitchToggleStyle(tint: .red))
                    Stepper("Number of Likes", value: $numberOfLikes, in: 0...100)
                    Text("This video has \(numberOfLikes) likes")
                    Link("Terms of Service", destination: URL(string: "https://www.youtube.com/watch?v=m0QQ-hWs8fc")!)
                })
            }
            .navigationTitle("Account")
            .toolbar(content: {
                ToolbarItemGroup(placement: .navigationBarTrailing, content: {
                    Button {
                        hideKeyboard()
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                    
                    Button("Save", action: saveUser)
                })
            })
            .accentColor(.red)
            //.onTapGesture {
            //    hideKeyboard()
            //}
        })
    }
    
    func saveUser() {
        print("User Saved")
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
