//
//  UIErrorsLoginScreen.swift
//  GHFollowersUITests
//
//  Created by Ezra Black on 2/12/22.
//

import XCTest

class UIErrorsLoginScreen: XCTestCase {
    
    func handleEmptyNameTextFieldErrorModalView() {
        XCTAssertNotNil(   XCUIApplication().staticTexts["Empty Username"])
        XCUIApplication().staticTexts["Empty Username"].tap()
        XCTAssertNotNil( XCUIApplication().staticTexts["Please enter a username. We need to know who to look for 😀."])
        XCUIApplication().staticTexts["Please enter a username. We need to know who to look for 😀."].tap()
        XCTAssertNotNil(XCUIApplication().buttons["Ok"])
        XCUIApplication().buttons["Ok"].tap()
    }
}
