//
//  ViewController.swift
//  Banky
//
//  Created by Simon Ojok on 04/07/2023.
//

import UIKit

class LoginViewController: UIViewController {
    private let appTitleLabel: UILabel = UILabel()
    private let welcomeMessageLabel: UILabel = UILabel()
    private let loginView: LoginView = LoginView()
    private let signInButton: UIButton = UIButton(type: .system)
    private let errorMessageLabel: UILabel = UILabel()
    
    private var username: String? {
        return loginView.usernameTextField.text
    }
    
    private var password: String? {
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    
}


extension LoginViewController {
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        appTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        appTitleLabel.text = "Banky"
        appTitleLabel.textAlignment = .center
        appTitleLabel.font = UIFont.systemFont(ofSize: 32)
        
        welcomeMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeMessageLabel.text = "Your premium source for all\nthings bankinging"
        welcomeMessageLabel.numberOfLines = 0
        welcomeMessageLabel.textAlignment = .center
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
    }
    
    private func layout() {
        view.addSubview(appTitleLabel)
        view.addSubview(welcomeMessageLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        NSLayoutConstraint.activate([
            appTitleLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            appTitleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            welcomeMessageLabel.topAnchor.constraint(equalTo: appTitleLabel.bottomAnchor, constant: 60)
        ])
        
        NSLayoutConstraint.activate([
            welcomeMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            welcomeMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            loginView.topAnchor.constraint(equalTo: welcomeMessageLabel.bottomAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2)
            
        ])
        
        NSLayoutConstraint.activate([
            errorMessageLabel.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor),
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2)
        ])
    }
}

extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true
        login()
    }
    
    
    func login() {
        guard let username  = username, let password = password else {
            assertionFailure("Username / password can never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username / password can not be black")
            return
        }
        
        if username == "Simon" && password == "password" {
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Incorrect username or password")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
