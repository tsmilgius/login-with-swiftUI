//
//  RegistrationView.swift
//  LoginDemo
//
//  Created by Tomas Smilgius on 11/12/2023.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var fullName = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    
    
    var body: some View {
        NavigationStack {
            VStack{
                Image("firebaseLogo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100 , height: 120)
                    .padding(.vertical, 32)
                
                VStack(spacing: 24){
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    InputView(text: $fullName,
                              title: "Full Name",
                              placeholder: "Enter your name")
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecureField: true)
                    
                    ZStack(alignment: .trailing) {
                        InputView(text: $confirmPassword,
                                  title: "Confirm Password",
                                  placeholder: "Confirm your password",
                                  isSecureField: true)
                        
                        if !password.isEmpty && !confirmPassword.isEmpty {
                            if password == confirmPassword {
                                Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemGreen))
                            } else {
                                Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemRed))
                        
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 12)
               
                
                Button {
                    Task {
                        try await viewModel.signUp(withEmail: email, password: password, fullName: fullName)
                    }
                } label: {
                    HStack {
                        Text("SIGN UP")
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.systemBlue))
                .cornerRadius(8)
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .padding(.top, 24)
                
                Spacer()
                
                Button(action: {dismiss()}, label: {
                    HStack(spacing: 3) {
                        Text("Already have an account?")
                        Text("Sign in")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    .font(.system(size: 14))
                })

            }
            
        }
    }
}


extension RegistrationView: AuthenticationProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && confirmPassword == password
        && password.count > 5
    }
}

#Preview {
    RegistrationView()
}
