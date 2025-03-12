//
//  LoginViewControllerUITests.swift
//  mintyn_ios_task
//
//  Created by apple on 12/03/2025.
//

import XCTest
@testable import mintyn_ios_task

class LoginViewControllerUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testLoginScreenElements() {
        // Navigate to login screen
        app.buttons["Login"].tap()
        
        // Verify UI elements are present
        XCTAssertTrue(app.textFields["Enter your phone number"].exists)
        XCTAssertTrue(app.secureTextFields["Enter your password"].exists)
        XCTAssertTrue(app.buttons["Login"].exists)
        XCTAssertTrue(app.staticTexts["Remember me"].exists)
        XCTAssertTrue(app.staticTexts["Forgot password?"].exists)
        XCTAssertTrue(app.staticTexts["Register new device"].exists)
    }
    
    func testLoginFlow() {
        // Navigate to login screen
        app.buttons["Login"].tap()
        
        // Enter credentials
        let phoneTextField = app.textFields["Enter your phone number"]
        phoneTextField.tap()
        phoneTextField.typeText("1234567890")
        
        let passwordField = app.secureTextFields["Enter your password"]
        passwordField.tap()
        passwordField.typeText("password")
        
        // Tap login button
        app.buttons["Login"].tap()
        
        // Verify we're on the home screen
        XCTAssertTrue(app.tabBars.buttons["Home"].exists)
    }
    
    func testLoginValidation() {
        // Navigate to login screen
        app.buttons["Login"].tap()
        
        // Try to login without credentials
        app.buttons["Login"].tap()
        
        // Verify error alert appears
        XCTAssertTrue(app.alerts["Input Error"].exists)
        
        // Dismiss alert
        app.alerts["Input Error"].buttons["OK"].tap()
        
        // We should still be on the login screen
        XCTAssertTrue(app.textFields["Enter your phone number"].exists)
    }
}

// HomeViewControllerUITests.swift
import XCTest
@testable import mintyn_ios_task

class HomeViewControllerUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
        // Login to navigate to home screen
        app.buttons["Login"].tap()
        let phoneTextField = app.textFields["Enter your phone number"]
        phoneTextField.tap()
        phoneTextField.typeText("1234567890")
        
        let passwordField = app.secureTextFields["Enter your password"]
        passwordField.tap()
        passwordField.typeText("password")
        
        app.buttons["Login"].tap()
    }
    
    func testHomeScreenElements() {
        // Verify key elements on home screen
        XCTAssertTrue(app.staticTexts["Account Balance"].exists)
        XCTAssertTrue(app.staticTexts["Quick Actions"].exists)
        XCTAssertTrue(app.staticTexts["Your Accounts"].exists)
        XCTAssertTrue(app.staticTexts["Recent Transactions"].exists)
    }
    
    func testTabBarNavigation() {
        // Test navigation between tabs
        app.tabBars.buttons["Cards"].tap()
        XCTAssertTrue(app.navigationBars["Cards"].exists)
        
        app.tabBars.buttons["History"].tap()
        XCTAssertTrue(app.navigationBars["History"].exists)
        
        app.tabBars.buttons["Settings"].tap()
        XCTAssertTrue(app.navigationBars["Settings"].exists)
        
        app.tabBars.buttons["Home"].tap()
        XCTAssertTrue(app.navigationBars["Home"].exists)
    }
    
    func testBalanceVisibilityToggle() {
        // Find and tap the eye button to toggle balance visibility
        let eyeButton = app.buttons["eye.slash.fill"]
        XCTAssertTrue(eyeButton.exists)
        eyeButton.tap()
        
        // Check that the balance text changed to hidden format
        XCTAssertTrue(app.staticTexts["₦*****"].exists)
    }
}

// SettingsViewControllerUITests.swift
import XCTest
@testable import mintyn_ios_task

class SettingsViewControllerUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
        // Login and navigate to settings
        app.buttons["Login"].tap()
        let phoneTextField = app.textFields["Enter your phone number"]
        phoneTextField.tap()
        phoneTextField.typeText("1234567890")
        
        let passwordField = app.secureTextFields["Enter your password"]
        passwordField.tap()
        passwordField.typeText("password")
        
        app.buttons["Login"].tap()
        
        // Navigate to Settings tab
        app.tabBars.buttons["Settings"].tap()
    }
    
    func testSettingsScreenElements() {
        // Verify sections exist
        XCTAssertTrue(app.staticTexts["Account"].exists)
        XCTAssertTrue(app.staticTexts["Preferences"].exists)
        XCTAssertTrue(app.staticTexts["Support"].exists)
        XCTAssertTrue(app.staticTexts["Logout"].exists)
    }
    
    func testNavigateToSystemSettings() {
        // Tap on System settings option
        app.staticTexts["System"].tap()
        
        // Verify we navigated to System Settings screen
        XCTAssertTrue(app.navigationBars["System Settings"].exists)
    }
    
    func testNavigateToLegalSettings() {
        // Tap on Legal option
        app.staticTexts["Legal"].tap()
        
        // Verify we navigated to Legal screen
        XCTAssertTrue(app.navigationBars["Legal"].exists)
    }
    
    func testLogoutFlow() {
        // Tap on Logout button
        app.staticTexts["Logout"].tap()
        
        // Verify confirmation alert appears
        XCTAssertTrue(app.alerts["Logout"].exists)
        
        // Confirm logout
        app.alerts["Logout"].buttons["Logout"].tap()
        
        // Verify we are back at welcome screen
        XCTAssertTrue(app.staticTexts["Welcome to"].exists)
        XCTAssertTrue(app.staticTexts["Mintyn Digital Bank"].exists)
    }
}
