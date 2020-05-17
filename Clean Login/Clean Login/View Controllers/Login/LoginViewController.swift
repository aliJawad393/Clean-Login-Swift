//
//  ViewController.swift
//  Clean Login
//
//  Created by Ali Jawad on 17/05/2020.
//  Copyright © 2020 Ali Jawad. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var loginAction: ((String, String) -> Void)?
    @IBOutlet weak var textFieldUserName: UITextField!
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func actShowHome(_ sender: UIButton) {
        if let loginAction = loginAction {
            loginAction(textFieldUserName.text ?? "", textFieldPassword.text ?? "")
        }

    }
}
