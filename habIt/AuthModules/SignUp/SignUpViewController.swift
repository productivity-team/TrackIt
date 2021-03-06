//
//  SignUpViewController.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 10.04.2021.
//  
//

import UIKit

final class SignUpViewController: UIViewController {
	private let output: SignUpViewOutput
    
    private let regLable = UILabel()
    private let emailField = UITextField()
    private let nameField = UITextField()
    private let passwordField = UITextField()
    private let nameboxImage = UIImageView()
    private let emailboxImage = UIImageView()
    private let passwordboxImage = UIImageView()
    private let signUpButton = UIButton()
    private let logInButton = UIButton()
    private let clyacsaImage = UIImageView(image: UIImage(named: "clyacsa3"))

    init(output: SignUpViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        
        view.backgroundColor = UIColor(named: "Background1")
        
        regLable.text = "Регистрация"
        regLable.font = .systemFont(ofSize: 30)
        regLable.font = UIFont(name: "Lato-Regular", size: 30)
        
        
        nameField.placeholder = "Имя"
        nameField.autocapitalizationType = .none
        nameField.leftViewMode = .always
        nameField.textColor = UIColor(red: 42/255, green: 43/255, blue: 43/255, alpha: 1)
        nameField.font = UIFont(name: "Lato-Regular", size: 18)
        
        
        emailField.placeholder = "Email"
        emailField.autocapitalizationType = .none
        emailField.leftViewMode = .always
        emailField.textColor = UIColor(red: 42/255, green: 43/255, blue: 43/255, alpha: 1)
        emailField.font = UIFont(name: "Lato-Regular", size: 18)
        emailField.autocorrectionType = .no
        
        passwordField.placeholder = "Пароль"
        passwordField.autocapitalizationType = .none
        passwordField.leftViewMode = .always
        passwordField.textColor = UIColor(red: 42/255, green: 43/255, blue: 43/255, alpha: 1)
        passwordField.font = UIFont(name: "Lato-Regular", size: 18)
        passwordField.autocorrectionType = .no
        passwordField.isSecureTextEntry.toggle() //делает пароль невидимым
        
        nameboxImage.image = UIImage(named: "TypingBox")
        emailboxImage.image = UIImage(named: "TypingBox")
        passwordboxImage.image = UIImage(named: "TypingBox")
        
        signUpButton.layer.cornerRadius = 25
        signUpButton.layer.masksToBounds = true
        signUpButton.setTitle("Зарегистрироваться", for: .normal)
        signUpButton.backgroundColor = UIColor(red: 134/255, green: 213/255, blue: 238/255, alpha: 1)
        signUpButton.setTitleColor(UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1), for: .normal)
        signUpButton.titleLabel?.font = UIFont(name: "Lato-Regular", size: 18)
        signUpButton.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
        
        logInButton.layer.cornerRadius = 25
        logInButton.layer.masksToBounds = true
        logInButton.setTitle("Уже зарегистрированы?", for: .normal)
        logInButton.setTitleColor(UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1), for: .normal)
        logInButton.layer.borderWidth = 3
        logInButton.layer.borderColor = CGColor(red: 77/255, green: 185/255, blue: 219/255, alpha: 1)
        logInButton.backgroundColor = UIColor(red: 249/255, green: 255/255, blue: 255/255, alpha: 1)
        logInButton.titleLabel?.font = UIFont(name: "Lato-Regular", size: 18)
        logInButton.addTarget(self, action: #selector(toLoginButtonPressed), for: .touchUpInside)
        
        
        [regLable, nameboxImage, emailField, emailboxImage, passwordboxImage, nameField, passwordField, signUpButton, logInButton, clyacsaImage].forEach { view.addSubview($0) }
    }
    
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
        regLable.pin
            .hCenter()
            .bottom(541)
            .sizeToFit()
        
        nameField.pin
            .hCenter()
            .bottom(471)
            .width(245)
            .height(50)
        
        emailField.pin
            .hCenter()
            .bottom(401)
            .width(245)
            .height(50)
        
        passwordField.pin
            .hCenter()
            .bottom(331)
            .width(245)
            .height(50)
        
        nameboxImage.pin
            .width(280)
            .height(50)
            .hCenter()
            .bottom(471)
        
        emailboxImage.pin
            .width(280)
            .height(50)
            .hCenter()
            .bottom(401)
        
        passwordboxImage.pin
            .width(280)
            .height(50)
            .hCenter()
            .bottom(331)
        
        signUpButton.pin
            .width(250)
            .height(50)
            .bottom(251)
            .hCenter()
        
        logInButton.pin
            .bottom(138)
            .hCenter()
            .height(50)
            .width(290)
        
        clyacsaImage.pin
            .width(435)
            .height(250)
            .above(of: regLable).marginVertical(107)
            .hCenter()
    }
    
    @objc
    private func signUpButtonPressed() {
        
        let name = nameField.text
        let email = emailField.text
        let password = passwordField.text
        
        output.signUpButtonPressed(name: name, email: email, password: password)
    }

    @objc
    private func toLoginButtonPressed() {
        output.toLoginButtonPressed()
    }
    
}

extension SignUpViewController: SignUpViewInput {
}
