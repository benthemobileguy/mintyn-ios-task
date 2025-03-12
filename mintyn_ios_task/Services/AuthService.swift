//
//  AuthService.swift
//  mintyn_ios_task
//
//  Created by Ben on 12/03/2025.
//

import Foundation

protocol AuthServiceProtocol {
    func login(phoneNumber: String, password: String, completion: @escaping (Result<UserModel, Error>) -> Void)
    func logout(completion: @escaping (Bool) -> Void)
}

enum AuthError: Error {
    case invalidCredentials
    case networkError
}

class MockAuthService: AuthServiceProtocol {
    func login(phoneNumber: String, password: String, completion: @escaping (Result<UserModel, Error>) -> Void) {
        // Simulate network delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // Simple validation - in a real app this would check against a backend
            if !phoneNumber.isEmpty && !password.isEmpty {
                let user = UserModel(phoneNumber: phoneNumber, isLoggedIn: true)
                UserDefaultsManager.shared.isLoggedIn = true
                UserDefaultsManager.shared.phoneNumber = phoneNumber
                completion(.success(user))
            } else {
                completion(.failure(AuthError.invalidCredentials))
            }
        }
    }
    
    func logout(completion: @escaping (Bool) -> Void) {
        UserDefaultsManager.shared.clearUserData()
        completion(true)
    }
}
