//
//  ViewController.swift
//  Clean Login
//
//  Created by Ali Jawad on 17/05/2020.
//  Copyright © 2020 Ali Jawad. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    private var loginAction: ((String, String) -> Void)?
    
    //MARK: UIView Components
    
    private lazy var textFieldEmail: UITextField = {
        let view = CustomTextField()
        view.keyboardType = .emailAddress
        view.autocapitalizationType = .none
        view.setPlaceholder(text: "Email Address")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var textFieldPassword: UITextField = {
        let view = CustomTextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setPlaceholder(text: "Password")
        view.isSecureTextEntry = true
        return view
    }()
    
    private lazy var buttonLogin: UIButton = {
        let view = UIButton(type: .system)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.71, green: 0.408, blue: 0.231, alpha: 1)
        view.setTitle("Login", for: .normal)
        view.titleLabel?.font = UIFont.systemFontOfAdjustableSize(17)
        view.setTitleColor(.white, for: .normal)
        view.addTarget(self, action: #selector(submitHandler(sender:)), for: .touchUpInside)
        return view
    }()
    
    private lazy var stackViewContent: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fill
        view.spacing = self.view.bounds.size.height*0.0455
        view.alignment = .fill
        
        let labelSignIn = UILabel()
        labelSignIn.translatesAutoresizingMaskIntoConstraints = false
        labelSignIn.text = "Sign In"
        labelSignIn.font = UIFont.systemFontOfAdjustableSize(29)
        labelSignIn.textColor = .black
        
        view.addArrangedSubview(labelSignIn)
        view.addArrangedSubview(textFieldEmail)
        view.addArrangedSubview(textFieldPassword)
        view.addArrangedSubview(buttonLogin)
        view.addArrangedSubview(UIView())
        return view
    }()
    
    //MARK: Init
    
    init(loginAction: ((String, String) -> Void)?) {
        self.loginAction = loginAction
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: Setup View
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(stackViewContent)
        layoutSubviews()
    }
    
    private func layoutSubviews() {
        NSLayoutConstraint.activate([
            stackViewContent.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewContent.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackViewContent.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            NSLayoutConstraint(item: stackViewContent, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 0.8, constant: 0),
            textFieldEmail.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.0418),
        ])
    }
    
    //MARK: Actions
    
    @objc func submitHandler(sender: UIButton) {
        loginAction?(textFieldEmail.text ?? "", textFieldPassword.text ?? "")

    }
}


//MARK: Custom Textfield


final class CustomTextField: UITextField {
    init() {
        super.init(frame: .zero)
        borderStyle = .none
        layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        textColor = .black
        font = UIFont.systemFontOfAdjustableSize(17)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.size.height / 2
        clipsToBounds = true
    }
    
    func setPlaceholder(text: String) {
        attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 0.329, green: 0.329, blue: 0.329, alpha: 1)])
    }
    
}

