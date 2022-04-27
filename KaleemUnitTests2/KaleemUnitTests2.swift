//
//  KaleemUnitTests2.swift
//  KaleemUnitTests2
//
//  Created by Sara Abdullah on 25/04/2022.
//
@testable import Kaleem
import XCTest

class KaleemUnitTests2: XCTestCase {
    var validation : SignUpVM!
    override func setUp()  {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        validation = SignUpVM()
    }

    override func tearDown()  {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        validation = nil
        super.tearDown()
    }

    func testInvalidName()  {
     
        let test =  validation.validateUserName(username: "سارة2022")
        XCTAssertNotEqual(test, "")
        
    }
    func testInvalidEmail()  {
     
        let test =  validation.validateEmail(email: "saraGmail.com")
        XCTAssertNotEqual(test, "")
        
    }
   
    func testInvalidPhone()  {
     
        let test =  validation.validatePhoneNo(phone: "0512345")
        XCTAssertNotEqual(test, "")
        
    }
    
    func testInvalidPass()  {
     
        let test =  validation.validatePass(pass: "sara77")
        XCTAssertNotEqual(test, "")
        
    }
    
//    func testValidSignUp()  {
//     
//        let test = validation.createNewAccount(email: "sara1alshreef@gmail.com", password: "Ss@12345", userType: "Speech-impaired", username: "Sara Alshreef", phone: "0550804411", accStatus: "none")
//        
//        XCTAssertEqual(test, "")
//    }
//    
//    func testـValidSignUp()  {
//     
//        let test = validation.createNewAccount(email: "sara1alshreef@gmail.com", password: "Ss@12345", userType: "Speech-impaired", username: "سارة الشريف", phone: "0550804411", accStatus: "none")
//        
//        XCTAssertEqual(test, "")
//    }
}
