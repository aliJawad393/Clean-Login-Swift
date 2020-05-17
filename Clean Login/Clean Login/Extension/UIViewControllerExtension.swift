//
//  UIViewControllerExtension.swift
//  Clean Login
//
//  Created by Ali Jawad on 17/05/2020.
//  Copyright © 2020 Ali Jawad. All rights reserved.
//

import UIKit

extension UIViewController {
    func displayMsg(title : String?, msg : String,
                    style: UIAlertController.Style = .alert,
          dontRemindKey : String? = nil) {
        if dontRemindKey != nil,
           UserDefaults.standard.bool(forKey: dontRemindKey!) == true {
            return
        }
        
        let ac = UIAlertController.init(title: title,
                   message: msg, preferredStyle: style)
        ac.addAction(UIAlertAction.init(title: "OK",
            style: .default, handler: nil))
        
        if dontRemindKey != nil {
            ac.addAction(UIAlertAction.init(title: "Don't Remind",
             style: .default, handler: { (aa) in
                UserDefaults.standard.set(true, forKey: dontRemindKey!)
                UserDefaults.standard.synchronize()
            }))
        }
        DispatchQueue.main.async {
            self.present(ac, animated: true, completion: nil)
        }
    }
}
