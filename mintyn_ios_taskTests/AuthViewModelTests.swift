//
//  AuthViewModelTests.swift
//  mintyn_ios_task
//
//  Created by Ben on 12/03/2025.
//

import XCTest
@testable import mintyn_ios_task

class AuthViewModelTests: XCTestCase {
    
    var sut: AuthViewModel!
    var mockAuthService: MockAuthService!
    
    override func setUp() {
        super.setUp()
        mockAuthService = MockAuthService()
        sut = AuthViewModel(authService: mockAuthService)
    }
    
    override func tearDown() {
        sut = nil
        mockAuthService = nil
        super.tearDown()
    }
    
    func testSuccessfulLogin() {
        // Given
        let expectation = XCTestExpectation(description: "Login success callback should be called")
        let phoneNumber = "1234567890"
        let password = "password"
        
        // When
        sut.login(phoneNumber: phoneNumber, password: password) { result in
            // Then
            switch result {
            case .success(let user):
                XCTAssertEqual(user.phoneNumber, phoneNumber)
                XCTAssertTrue(user.isLoggedIn)
                XCTAssertTrue(UserDefaultsManager.shared.isLoggedIn)
                XCTAssertEqual(UserDefaultsManager.shared.phoneNumber, phoneNumber)
                expectation.fulfill()
            case .failure:
                XCTFail("Login should succeed with valid credentials")
            }
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testFailedLoginWithEmptyCredentials() {
        // Given
        let expectation = XCTestExpectation(description: "Login failure callback should be called")
        let phoneNumber = ""
        let password = ""
        
        // When
        sut.login(phoneNumber: phoneNumber, password: password) { result in
            // Then
            switch result {
            case .success:
                XCTFail("Login should fail with empty credentials")
            case .failure(let error):
                XCTAssertEqual(error as? AuthError, AuthError.invalidCredentials)
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testLogout() {
        // Given
        let expectation = XCTestExpectation(description: "Logout callback should be called")
        
        // When
        sut.logout { success in
            // Then
            XCTAssertTrue(success)
            XCTAssertFalse(UserDefaultsManager.shared.isLoggedIn)
            XCTAssertNil(UserDefaultsManager.shared.phoneNumber)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
}
