//
//  Router.swift
//  Clean Login
//
//  Created by Ali Jawad on 17/05/2020.
//  Copyright © 2020 Ali Jawad. All rights reserved.
//

import Foundation
import UIKit

protocol RouterProtocol {
    
    func navigateToLoginViewControllerWithLoginAction(loginHandler:@escaping(_ email: String, _ password: String) ->Void)
    func navigateToHomeViewController()
    func showErrorMessage(title: String?, message: String)
    func showMessage_networkError(message: String, retryHandler:@escaping ()->Void)

}


class CleanLoginRouter: RouterProtocol {
    
    let navigationController: UINavigationController
    let viewControllerFactory: ViewControllerFactory
    
    init(navigationController: UINavigationController, viewControllerFactory: ViewControllerFactory) {
        self.navigationController = navigationController
        self.viewControllerFactory = viewControllerFactory
    }
    
    func showMessage_networkError(message: String, retryHandler: @escaping () -> Void) {
        self.navigationController.visibleViewController?.displayMsg(title: "API failure", msg: message)

    }
    
    func navigateToLoginViewControllerWithLoginAction(loginHandler: @escaping (String, String) -> Void) {
        let controller = self.viewControllerFactory.loginViewController(loginAction: loginHandler)
        if let controller = controller {
            DispatchQueue.main.async {
                self.navigationController.pushViewController(controller, animated: true)

            }

        }
        
    }
    
    func navigateToHomeViewController() {
        DispatchQueue.main.async {
            let controller = self.viewControllerFactory.homeViewController()
            if let controller = controller {
                self.navigationController.pushViewController(controller, animated: true)

            }
        }
        
    }
  
    
    func showErrorMessage(title: String?, message: String) {
        self.navigationController.visibleViewController?.displayMsg(title: title, msg: message)
    }
    
}
