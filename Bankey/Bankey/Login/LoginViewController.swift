//
//  ViewController.swift
//  Bankey
//
//  Created by Bootcamp 1 on 2023-01-17.
//

import UIKit

class LoginViewController: UIViewController {

    let bankeyTitle = UILabel()
    let loginView = LoginView()
    let singInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    var password: String? {
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
        
        bankeyTitle.translatesAutoresizingMaskIntoConstraints = false
        bankeyTitle.text = "Bankey"
//        bankeyTitle.font.withSize(30)
        bankeyTitle.textAlignment = .center
        bankeyTitle.numberOfLines = 0
        bankeyTitle.textColor = .black
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        singInButton.translatesAutoresizingMaskIntoConstraints = false
        singInButton.configuration = .filled()
        singInButton.configuration?.imagePadding = 8
        singInButton.setTitle("Sing In", for: [])
        singInButton.addTarget(self, action: #selector(singInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.isHidden = true
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.numberOfLines = 0
    }
    
    private func layout() {
        view.addSubview(bankeyTitle)
        view.addSubview(loginView)
        view.addSubview(singInButton)
        view.addSubview(errorMessageLabel)
        
        // bankey label
        NSLayoutConstraint.activate([
            bankeyTitle.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 2),
            bankeyTitle.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            bankeyTitle.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        // login view
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        // sing in button
        NSLayoutConstraint.activate([
            singInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            singInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            singInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        // error label
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: singInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: singInButton.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: singInButton.trailingAnchor)
        ])
    }
}

extension LoginViewController {
    @objc func singInTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true
        login()
    }
    
    func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username / Password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(message: "Username / Password cannot be blank")
            return
        }
        
        if username == "Mathias" && password == "123" {
            singInButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(message: "Username / Password incorrect")
        }
    }
    
    private func configureView(message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
