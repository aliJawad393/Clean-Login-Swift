//
//  LoginInputEmailFormatValidator.swift
//  Clean Login
//
//  Created by Ali Jawad on 17/05/2020.
//  Copyright © 2020 Ali Jawad. All rights reserved.
//

import Foundation

class LoginInputEmailFormatValidator: ValidatorBase, LoginInputValidatorProtocol {
    
    func validateLoginInput(userName: String, password: String, errors: inout Dictionary<String, String>) {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if(!emailPred.evaluate(with: userName)) {
            errors["email"] = "Email format is incorrect"
            return

        }
        
        if let successor: LoginInputValidatorProtocol = self.successor as? LoginInputValidatorProtocol {
            successor.validateLoginInput(userName: userName, password: password, errors: &errors)
        }
    }
}
