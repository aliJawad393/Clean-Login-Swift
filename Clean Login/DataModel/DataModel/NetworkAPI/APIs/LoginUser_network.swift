//
//  PT_fetchWeatherData_network.swift
//  DataModel
//
//  Created by Ali Jawad on 23/03/2020.
//  Copyright © 2020 Ali Jawad. All rights reserved.
//

import Foundation


public class LoginModel: Codable {
    
    public let token: String?
    
    enum CodingKeys : String,CodingKey {
        case token = "token"
    }
    
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        token = try values.decodeIfPresent(String.self, forKey: .token)
       
    }
    
}

public class LoginUser_network: NetworkProtocol, ApiProtocol {
    
    var networkManager: NetworkManagerProtocol
    var parser: ParserProtocol
    public init(networkManager: NetworkManagerProtocol, parser: ParserProtocol) {
        self.networkManager = networkManager
        self.parser = parser
    }
    
    public func executeRequest<P, T>(parameters: P?, completionHandler: @escaping (T?, Error?) -> Void) -> Cancellable? {
        
        return networkManager.fetchData(parameters: parameters, api: self) {[weak self] (data, apiResponse, error) in
        
                if let data = data {
                completionHandler((self?.parser.parseResponse(data: data, response: LoginModel.self)) as? T, error)

                }
        }
        
    }
    
    //MARK: API Protocol
    
    public func apiEndPoint() -> String {
        return "authenticate"
    }
    
    public func apiHeader() -> (String, String)? {
        return nil
    }
    
    public func httpMethod() -> String {
        return enumHttpMethod.post.rawValue
    }
    
}
