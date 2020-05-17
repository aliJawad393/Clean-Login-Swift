//
//  ViewControllerFactory.swift
//  Clean Login
//
//  Created by Ali Jawad on 17/05/2020.
//  Copyright © 2020 Ali Jawad. All rights reserved.
//

import Foundation
import UIKit

protocol ViewControllerFactory {
    
    func loginViewController(loginAction:@escaping(String, String) ->Void) -> UIViewController?
    func homeViewController() -> UIViewController?
     
}


class CleanLoginViewControllerFactory: ViewControllerFactory {
    func loginViewController(loginAction:@escaping(String, String) ->Void) -> UIViewController? {
        let viewController: LoginViewController? = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        
        viewController?.loginAction = loginAction
        return viewController
        
    }
    
    
    func homeViewController() -> UIViewController? {
        let homeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        return homeViewController
    }

}
