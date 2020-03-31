//
//  LoginView.swift
//  CTAEvents
//
//  Created by Melinda Diaz on 3/20/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//

import UIKit

class LoginView: UIView {
    
    //TODO: Fix stackview constraints
    
    public lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        label.text = "Is this your first time? Create an account below"
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .systemPink
        return label
    }()
    
    public lazy var CTANameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 25)
        label.attributedText = FormattedString.turnMyTextIntoColorText("CTA Events & Art")
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    public lazy var CTALogo: UIImageView = {
        let iV = UIImageView()
        iV.image = UIImage(named: "ModernArt")
        iV.contentMode = .scaleAspectFit
        return iV
    }()
    
    public lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        tf.placeholder = "email"
        tf.backgroundColor = .systemBackground
        tf.layer.cornerRadius = 5.0
        return tf
    }()
    
    public lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        tf.placeholder = "password"
        tf.backgroundColor = .systemBackground
        tf.layer.cornerRadius = 5.0
        return tf
    }()
    
    public lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("LOGIN", for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 24)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.systemRed, for: .normal)
        button.layer.cornerRadius = 7.0
        button.backgroundColor = .systemBackground
        return button
    }()
    
    public lazy var stackView: UIStackView = {
        let sv = UIStackView()
        //when dealing with stackViews you need to know which way the stack view is going and the distribution
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.spacing = 7
        return sv
    }()
    
    public lazy var accountStateMessage: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 14)
        label.numberOfLines = 0
        label.text = "Don't have an Account? Click sign up"
        label.textColor = .systemRed
        label.backgroundColor = .systemBackground
        label.layer.cornerRadius = 7.0
        return label
    }()
    
    public lazy var accountStateButton: UIButton = {
        let button = UIButton()
        button.setTitle("SignUp", for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
        button.titleLabel?.textAlignment = .left
        button.backgroundColor = .systemBackground
        button.setTitleColor(.systemRed, for: .normal)
        button.layer.cornerRadius = 7.0
        return button
    }()
    
    public lazy var constraintY: NSLayoutConstraint = {
        let constraint = NSLayoutConstraint()
        return constraint
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setUpInfoLabelConstraints()
        setUpCTANameLabelConstraints()
        setUpCTALogoView()
        setUpEmailTFConstraints()
        setUpPasswordTFConstraints()
        setUpLoginButtonConstraints()
        setUpStackViewConstraints()
    }
    
    private func setUpInfoLabelConstraints() {
        addSubview(infoLabel)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        constraintY = infoLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 8)
         constraintY.isActive = true
        
        NSLayoutConstraint.activate([
            
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setUpCTANameLabelConstraints() {
        addSubview(CTANameLabel)
        CTANameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            CTANameLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 40),
            CTANameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            CTANameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40)
            
        ])
    }
    
    private func setUpCTALogoView() {
        addSubview(CTALogo)
        CTALogo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            CTALogo.topAnchor.constraint(equalTo: CTANameLabel.bottomAnchor),
            CTALogo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 150),
            CTALogo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -150),
            CTALogo.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4)
        ])
    }
    
    private func setUpEmailTFConstraints() {
        addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: CTALogo.bottomAnchor, constant: 40),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40)
        ])
    }
    
    private func setUpPasswordTFConstraints() {
        addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo:emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40)
        ])
    }
    private func setUpLoginButtonConstraints() {
        addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            loginButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setUpStackViewConstraints() {
        addSubview(stackView)
        stackView.addArrangedSubview(accountStateMessage)
        stackView.addArrangedSubview(accountStateButton)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            stackView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
