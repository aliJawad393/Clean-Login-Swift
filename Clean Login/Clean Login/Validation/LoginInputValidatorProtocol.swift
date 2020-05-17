//
//  LoginInputValidatorProtocol.swift
//  Clean Login
//
//  Created by Ali Jawad on 17/05/2020.
//  Copyright © 2020 Ali Jawad. All rights reserved.
//

import Foundation

protocol LoginInputValidatorProtocol {
    func validateLoginInput(userName: String, password: String, errors: inout Dictionary<String, String>)
}
