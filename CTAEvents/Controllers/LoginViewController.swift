//
//  ViewController.swift
//  CTAEvents
//
//  Created by Melinda Diaz on 3/17/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//

import UIKit
import FirebaseAuth

enum AccountState {
  case existingUser
  case newUser
}
//TODO: Fix keyboard handling IS Secure Text
class LoginViewController: UIViewController {

     public var loginView = LoginView()
    private var accountState: AccountState = .existingUser
 
    
    override func loadView() {
        view = loginView
    }

        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .black
            clearErrorLabel()
        }
        @objc public func loginButtonPressed(_ sender: UIButton){
            print("login button pressed")
            guard let email = loginView.emailTextField.text,
                !email.isEmpty,
                let password = loginView.passwordTextField.text,
                !password.isEmpty else {
                    showAlert(title: "Missing Fields", message: " You need to fill ALL fields in order to move on")
                    return
            }
            continueLoginFlow(email: email, password: password)
        }
        //TODO: Finish ContinueFlowLogin
        private func continueLoginFlow(email: String, password: String) {
            if accountState == .existingUser {
                AuthenticationSession.shared.signExistingUser(email: email, password: password) { [weak self] (result) in
                    switch result {
                    case .failure(let error):
                        DispatchQueue.main.async {
                            //it will be a full out readable description of the error
                            self?.loginView.infoLabel.text = "\(error.localizedDescription)"
                            self?.loginView.infoLabel.textColor = .systemRed
                        }
                    case .success:
                        DispatchQueue.main.async {
                            self?.loginView.infoLabel.text = "Welcome Back user "
                            self?.navigateToMainView()
                        }
                    }
                }
            } else {
                AuthenticationSession.shared.createNewUser(email: email, password: password) { [weak self] (result) in
                    switch result {
                    case .failure(let error):
                        DispatchQueue.main.async {
                            //it will be a full out readable description of the error
                            self?.loginView.infoLabel.text = "\(error.localizedDescription)"
                            self?.loginView.infoLabel.textColor = .systemRed
                        }
                    case .success:
                        DispatchQueue.main.async {
                            self?.navigateToMainView()
                        }
                    }
                }
            }
        }
        
        private func navigateToMainView() {
            UIViewController.showViewController(storyBoardName: "MainViewStoryBoard", viewControllerId: "TabBarController")
        }
        //TODO: Fix
        private func clearErrorLabel() {
            loginView.infoLabel.text = ""
        }
}

