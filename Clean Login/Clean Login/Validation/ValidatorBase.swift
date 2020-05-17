//
//  ValidatorBase.swift
//  Clean Login
//
//  Created by Ali Jawad on 17/05/2020.
//  Copyright © 2020 Ali Jawad. All rights reserved.
//

import Foundation

protocol ValidatorBaseProtocol {
    func setSuccessor<T: ValidatorBaseProtocol>(successor: T)
}

class ValidatorBase: ValidatorBaseProtocol {
    var successor: ValidatorBaseProtocol?
    func setSuccessor<T>(successor: T) where T : ValidatorBaseProtocol {
        self.successor = successor
    }
    
    
}
