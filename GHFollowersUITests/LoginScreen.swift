//
//  LoginScreen.swift
//  GHFollowersUITests
//
//  Created by Ezra Black on 2/12/22.
//

import XCTest

class LoginScreen: XCTestCase {
    
    
    
    public lazy var githubFollowersLogo = XCUIApplication().windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
    public lazy var enterAUsernameTextField = XCUIApplication().textFields["Enter a username"]
    public lazy var backgroundWithKeyboardPresent = XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
    public lazy var keyboardGo = XCUIApplication().buttons["Go"]
    public lazy var getFollowersStaticText = XCUIApplication().staticTexts["Get Followers"]
    func testThreading() {
                
        
        
        //get followers button
        XCUIApplication()/*@START_MENU_TOKEN@*/.staticTexts["Get Followers"]/*[[".buttons[\"Get Followers\"].staticTexts[\"Get Followers\"]",".staticTexts[\"Get Followers\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        
        //empty username Window
        
      //go button on keyboard
        
       
        
        
        
        
        //search
        
        
        
        //favorites
    }
    
    func validateLoginScreenUILogoAndKeyboard() {
        XCTAssertNotNil(githubFollowersLogo.exists)
        XCTAssertNotNil(backgroundWithKeyboardPresent.exists)
    }
    
    
    
}
     
