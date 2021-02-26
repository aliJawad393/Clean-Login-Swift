//
//  HomeViewController.swift
//  Clean Login
//
//  Created by Ali Jawad on 17/05/2020.
//  Copyright © 2020 Ali Jawad. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    private lazy var labelText: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Logged in successfully"
        view.font = UIFont.systemFontOfAdjustableSize(29)
        view.textColor = .black
        return view
    }()
    
    //MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(labelText)
        
        NSLayoutConstraint.activate([
            labelText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelText.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
