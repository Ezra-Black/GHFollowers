//
//  GHFollowersUITests.swift
//  GHFollowersUITests
//
//  Created by Ezra Black on 2/12/22.
//

import XCTest

class LoginPageHappyFlowTests: XCTestCase {
    
    // Things to automate: Different states for every screen.
    // Check for happy paths, and bad paths as well as errors.
    //Create a full happy flow that runs the entire application for a single search.
    //find a user name, add them, favorite them and check out the safari view
    //things to note: after adding a user to your favorites, now the favorites tab state has altered. handle that. 
    // Test Variables
    private var testLoginScreen: LoginScreen!
    private var UIErrors: UIErrorsLoginScreen!

    override func setUp() {
        let app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
        testLoginScreen = LoginScreen()
        UIErrors = UIErrorsLoginScreen()
    }

    func testUIObjectsOnLoginScreen() {
        testLoginScreen.validateLoginScreenUILogoAndKeyboard()
        print("⚠️ Github Logo Exists ⚠️")
        XCTAssert(testLoginScreen.enterAUsernameTextField.exists)
        testLoginScreen.enterAUsernameTextField.tap()
        testLoginScreen.backgroundWithKeyboardPresent.tap()
        testLoginScreen.getFollowersStaticText.tap()
        UIErrors.handleEmptyNameTextFieldErrorModalView()
    }
    
    func testErrorHandlingLoginScreen() {
        testLoginScreen.validateLoginScreenUILogoAndKeyboard()
        print("⚠️ Github Logo Exists ⚠️")
        XCTAssert(testLoginScreen.enterAUsernameTextField.exists)
        testLoginScreen.enterAUsernameTextField.tap()
        testLoginScreen.keyboardGo.tap()
        UIErrors.handleEmptyNameTextFieldErrorModalView()
    }
    
    func test3() {
     
    }
}
