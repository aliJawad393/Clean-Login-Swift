//
//  NetworkServiceExecutor.swift
//  Clean Login
//
//  Created by Ali Jawad on 17/05/2020.
//  Copyright © 2020 Ali Jawad. All rights reserved.
//

import Foundation
import DataModel



protocol NetworkServiceExecutorProtocol  {
    func authenticateUser(userName: String, password: String, successBlock: @escaping () -> Void, failureBlock:@escaping (Error?) ->Void)
}

class NetworkServiceExecutor: NetworkServiceExecutorProtocol {
    var networkService: DataHandlerProtocol
    var keychain: KeychainProtocol
    
    init(networkService: DataHandlerProtocol, keychain: KeychainProtocol) {
        self.networkService = networkService
        self.keychain = keychain
    }
    
    func authenticateUser(userName: String, password: String, successBlock: @escaping () -> Void, failureBlock:@escaping (Error?) ->Void) {
        _ = self.networkService.fetchData(parameters: ["UserName":userName, "password":password]) { (response: LoginModel?, error: Error?) in
            
            /////// NOTE: ignoring result from API and navigating ahead.
            
            successBlock()
            
//            if let error = error {
//                failureBlock(error)
//            } else if let token = response?.token {
//                self?.keychain.saveTokenToKeyChain(token: token)
//                successBlock()
//            }
            
            
        }
    }
}
