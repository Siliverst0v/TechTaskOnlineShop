//
//  UserDefaultsManager.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 17.03.2023.
//

import Foundation

final class UserDefaultsManager {
    private enum Keys: String {
        case userIsLoggedIn = "userIsLoggedIn"
        case currentUser = "currentUser"
    }
    
    static var userIsLoggedIn: Bool {
        get {
            UserDefaults.standard.bool(forKey: Keys.userIsLoggedIn.rawValue)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.userIsLoggedIn.rawValue)
        }
    }
    
    static var currentUser: Data? {
        get {
            guard let data = UserDefaults.standard.data(forKey: Keys.currentUser.rawValue) else {return nil}
            return data
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.currentUser.rawValue)
        }
    }
}
