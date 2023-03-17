//
//  RegistrationViewModel.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 13.03.2023.
//

import Foundation

protocol RegistrationViewModelType {
    func emailIsValid(email: String) -> Bool
    func checkUserDataWith(firstName: String, lastName: String, email: String) -> Bool
}

final class RegistrationViewModel: RegistrationViewModelType {
    
    func checkUserDataWith(firstName: String, lastName: String, email: String) -> Bool {
        let userIsRegistered = UserDefaults.standard.object(forKey: firstName)
        if userIsRegistered == nil {
            let user = User(firstName: firstName, lastName: lastName, email: email)
            saveUserData(user: user, for: firstName)
            return true
        } 
        return false
    }
    
    private func saveUserData(user: User, for key: String) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            UserDefaults.standard.set(encoded, forKey: key)
            UserDefaultsManager.currentUser = encoded
            UserDefaultsManager.userIsLoggedIn = true
        }
    }
    
    func emailIsValid(email: String) -> Bool {
        let emailValidationRegex = "^[\\p{L}0-9!#$%&'*+\\/=?^_`{|}~-][\\p{L}0-9.!#$%&'*+\\/=?^_`{|}~-]{0,63}@[\\p{L}0-9-]+(?:\\.[\\p{L}0-9-]{2,7})*$"
        let emailValidationPredicate = NSPredicate(format: "SELF MATCHES %@", emailValidationRegex)
        return emailValidationPredicate.evaluate(with: email)
    }
}
