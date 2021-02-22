//
//  Clean_LoginTests.swift
//  Clean LoginTests
//
//  Created by Ali Jawad on 17/05/2020.
//  Copyright © 2020 Ali Jawad. All rights reserved.
//

import XCTest
@testable import Clean_Login

class LoginInputUserNameLengthValidatorTests: XCTestCase {

    func test_emptyUserName_givesError() {
        let sut = LoginInputUserNameLengthValidator()
        var errors: [String: String] = [:]
        sut.validateLoginInput(userName: "", password: "", errors: &errors)
        XCTAssertEqual(errors["username"], "Username cannot be empty")
    }
    
    func test_nonEmptyUserName_givesNoError() {
        let sut = LoginInputUserNameLengthValidator()
        var errors: [String: String] = [:]
        sut.validateLoginInput(userName: "username", password: "", errors: &errors)
        XCTAssert(errors.isEmpty)
    }
}
