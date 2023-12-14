//
//  ProfileView.swift
//  LoginDemo
//
//  Created by Tomas Smilgius on 11/12/2023.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        if let user = viewModel.currentUser {
            List{
                Section{
                    HStack {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray4))
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fullName)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            Text(user.email)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                    
                }
                Section("General"){
                    HStack {
                        SettingRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                        Spacer()
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundColor(Color(.systemGray))
                    }
                }
                Section("Account"){
                    Button {
                        Task{
                            viewModel.signOut()
                        }
                    } label:{
                        SettingRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: Color(.red))
                    }
                        
                    Button {
                        print("Deleting account")
                    } label:{
                        SettingRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: Color(.red))
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
