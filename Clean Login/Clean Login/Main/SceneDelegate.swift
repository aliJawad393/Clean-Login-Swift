//
//  SceneDelegate.swift
//  Clean Login
//
//  Created by Ali Jawad on 17/05/2020.
//  Copyright © 2020 Ali Jawad. All rights reserved.
//

import UIKit
import DataModel

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var flow: Flow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let navigationController = UINavigationController()
        navigationController.navigationBar.isHidden = true
        let viewControllerFactory = CleanLoginViewControllerFactory()
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .light
        }
        let router = CleanLoginRouter(navigationController: navigationController, viewControllerFactory: viewControllerFactory)
        
        let keychain = Keychain()
        
        flow = Flow(router: router)
        
        
        let networkManager = NetworkManager(baseURLString:"http://94.206.102.22/app/")
        
        let parser = ParseManager()
        let networkAPI = LoginUser_network(networkManager: networkManager, parser: parser)
        
        let networkSevice =  ServiceFetchDataFromNetwork(networkHandler: networkAPI)
        
        let loginUserNameValidator = LoginInputUserNameLengthValidator()
        let loginPasswordValidator = LoginInputPasswordLengthValidator()
        let emailFormatValidator = LoginInputEmailFormatValidator()
        
        loginUserNameValidator.setSuccessor(successor: loginPasswordValidator)
        loginPasswordValidator.setSuccessor(successor: emailFormatValidator)
        flow?.start(loginNetworkServiceExecutor: NetworkServiceExecutor(networkService: networkSevice, keychain: keychain), validator: loginUserNameValidator)
        
    }
}

