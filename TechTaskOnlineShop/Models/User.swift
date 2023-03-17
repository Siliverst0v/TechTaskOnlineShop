//
//  User.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 14.03.2023.
//

import Foundation

struct User: Codable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String?
    
    init(firstName: String, lastName: String, email: String, password: String? = nil) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
    }
}
