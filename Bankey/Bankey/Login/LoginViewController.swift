//
//  ViewController.swift
//  Bankey
//
//  Created by Bootcamp 1 on 2023-01-17.
//

import UIKit

class LoginViewController: UIViewController {

//    let bankeyTitle = UILabel()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
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
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.text = "Bankey"

        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textAlignment = .center
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.numberOfLines = 0
        subtitleLabel.text = "Your premium source for all things banking!"
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
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(loginView)
        view.addSubview(singInButton)
        view.addSubview(errorMessageLabel)
        
        // Title
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 3),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Subtitle
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subtitleLabel.bottomAnchor, multiplier: 3),
            subtitleLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
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
