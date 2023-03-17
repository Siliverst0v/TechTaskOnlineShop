//
//  LoginViewModel.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 13.03.2023.
//

import Foundation

protocol LoginViewModelType {
    func checkUserDataWith(firstName: String) -> Bool
}

final class LoginViewModel: LoginViewModelType {
    
    func checkUserDataWith(firstName: String) -> Bool {
        UserDefaults.standard.object(forKey: firstName) != nil
    }
}
