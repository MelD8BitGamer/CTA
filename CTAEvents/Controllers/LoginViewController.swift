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
  private var keyboardIsVisible = false
    
    
    override func loadView() {
        view = loginView
    }
//
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .black
            loginView.loginButton.addTarget(self, action: #selector(loginButtonPressed(_:)), for: .touchUpInside)
          //  clearErrorLabel()
        }
        @objc public func loginButtonPressed(_ sender: UIButton){
            loginView.constraintY.constant -= 120
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
                           // self?.navigateToMainView()
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
                         //   self?.navigateToMainView()
                        }
                    }
                }
            }
        }
//
//        private func navigateToMainView() {
//            UIViewController.showViewController(storyBoardName: "MainViewStoryBoard", viewControllerId: "TabBarController")
//        }
//        //TODO: Fix
//        private func clearErrorLabel() {
//            loginView.infoLabel.text = ""
//        }
//    //when your viewController on screen you register it
//      private func registerForKeyboardNotifications() {
//          //this is a singleton, we want to add observer because we want to listen to ourselves. selector is what gets called
//          //we want to listen to keyboard will show. when the keyboard comes upUIResponder will always have the resignFirstResponder(), We have 2 selectors keyboard will show and keyboard will hide. it can pass in data but it could be buggy
//          NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
//          //keyboardWillShow is a key and keyboard will hide will hide it
//          NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
//      }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
