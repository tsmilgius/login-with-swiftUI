//
//  ProfileView.swift
//  LoginDemo
//
//  Created by Tomas Smilgius on 11/12/2023.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        List{
            Section{
                HStack {
                    Text("TS")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 72, height: 72)
                        .background(Color(.systemGray4))
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Tomas Smilgius")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top, 4)
                        Text("tsmilgius@gmail.com")
                            .font(.footnote)
                            .accentColor(.gray)
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
                    print("Signing out")
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

#Preview {
    ProfileView()
}
