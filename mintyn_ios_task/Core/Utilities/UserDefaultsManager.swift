//
//  UserDefaultsManager.swift
//  mintyn_ios_task
//
//  Created by Ben on 12/03/2025.
//

import Foundation

class UserDefaultsManager {
    private enum Keys {
        static let isLoggedIn = "isLoggedIn"
        static let phoneNumber = "phoneNumber"
    }
    
    static let shared = UserDefaultsManager()
    
    private let defaults = UserDefaults.standard
    
    private init() {}
    
    var isLoggedIn: Bool {
        get {
            return defaults.bool(forKey: Keys.isLoggedIn)
        }
        set {
            defaults.set(newValue, forKey: Keys.isLoggedIn)
        }
    }
    
    var phoneNumber: String? {
        get {
            return defaults.string(forKey: Keys.phoneNumber)
        }
        set {
            defaults.set(newValue, forKey: Keys.phoneNumber)
        }
    }
    
    func clearUserData() {
        isLoggedIn = false
        phoneNumber = nil
    }
}

