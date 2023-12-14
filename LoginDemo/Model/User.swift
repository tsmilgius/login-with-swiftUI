//
//  User.swift
//  LoginDemo
//
//  Created by Tomas Smilgius on 11/12/2023.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullName: String
    let email: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
    
}

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, fullName: "Tomas Smilgius", email: "tsmilgius@gmail.com")
}
