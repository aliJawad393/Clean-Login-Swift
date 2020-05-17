//
//  KeyChain.swift
//  DataModel
//
//  Created by Ali Jawad on 27/04/2020.
//  Copyright © 2020 Ali Jawad. All rights reserved.
//

import Foundation

public protocol KeychainProtocol {
     func saveTokenToKeyChain(token: String)
     func getTokenFromKeychain() -> String
}

public class Keychain: KeychainProtocol {
    
    public init() {
        
    }
    
     public func saveTokenToKeyChain(token: String) {
        // Save in keychain here.. Leaving that part to save time...
    }
    
     public func getTokenFromKeychain() -> String {
        // returning Hardcoded Token
        
        return "dummyToken"
    }
}
