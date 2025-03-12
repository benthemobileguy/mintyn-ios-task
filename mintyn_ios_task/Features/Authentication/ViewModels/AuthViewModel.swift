//
//  AuthViewModel.swift
//  mintyn_ios_task
//
//  Created by Ben on 12/03/2025.
//

import Foundation

class AuthViewModel {
    private let authService: AuthServiceProtocol
    
    init(authService: AuthServiceProtocol = MockAuthService()) {
        self.authService = authService
    }
    
    func login(phoneNumber: String, password: String, completion: @escaping (Result<UserModel, Error>) -> Void) {
        authService.login(phoneNumber: phoneNumber, password: password, completion: completion)
    }
    
    func logout(completion: @escaping (Bool) -> Void) {
        authService.logout(completion: completion)
    }
    
    var isLoggedIn: Bool {
        return UserDefaultsManager.shared.isLoggedIn
    }
}

