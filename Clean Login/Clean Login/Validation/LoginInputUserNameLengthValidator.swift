//
//  LoginInputUserNameLengthValidator.swift
//  Clean Login
//
//  Created by Ali Jawad on 17/05/2020.
//  Copyright © 2020 Ali Jawad. All rights reserved.
//

import Foundation

class LoginInputUserNameLengthValidator: ValidatorBase, LoginInputValidatorProtocol {
    
    func validateLoginInput(userName: String, password: String, errors: inout Dictionary<String, String>) {
        if(userName.count == 0) {
            errors["username"] = "Username cannot be empty"
            return
        }
        
        if let successor: LoginInputValidatorProtocol = self.successor as? LoginInputValidatorProtocol {
            successor.validateLoginInput(userName: userName, password: password, errors: &errors)
        }
    }
}
