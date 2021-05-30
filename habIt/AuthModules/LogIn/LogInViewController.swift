//
//  LogInViewController.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 08.04.2021.
//  
//

import UIKit
import PinLayout

final class LogInViewController: UIViewController {
    private let output: LogInViewOutput
    
    private let containerView = UIView()
    private let labelLogIn = UILabel()
    private let emailField = UITextField()
    private let passwordField = UITextField()
    private let loginButton = UIButton()
    private let signupButton = UIButton()
    private let emailboxImage1 = UIImageView()  // Овальная штуковина за надписью Email
    private let passwordboxImage = UIImageView()
    private let clyacsaImage = UIImageView(image: UIImage(named: "clyacsa2"))
    
    
    init(output: LogInViewOutput) {
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
        
        loginButton.layer.cornerRadius = 25
        loginButton.layer.masksToBounds = true
        loginButton.setTitle("Войти", for: .normal)
        loginButton.backgroundColor = UIColor(red: 134/255, green: 213/255, blue: 238/255, alpha: 1)
        loginButton.setTitleColor(UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1), for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "Lato-Regular", size: 18)
        loginButton.addTarget(self, action: #selector(logInButtonPressed), for: .touchUpInside)
        
        signupButton.layer.cornerRadius = 25
        signupButton.layer.masksToBounds = true
        signupButton.setTitle("Еще нет аккаунта?", for: .normal)
        signupButton.setTitleColor(UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1), for: .normal)
        signupButton.layer.borderWidth = 3
        signupButton.layer.borderColor = CGColor(red: 77/255, green: 185/255, blue: 219/255, alpha: 1)
        signupButton.backgroundColor = UIColor(red: 249/255, green: 255/255, blue: 255/255, alpha: 1)
        signupButton.titleLabel?.font = UIFont(name: "Lato-Regular", size: 18)
        signupButton.addTarget(self, action: #selector(toSignUpButtonPressed), for: .touchUpInside)
        
        labelLogIn.text = "Вход"
        labelLogIn.font = .systemFont(ofSize: 30)
        labelLogIn.font = UIFont(name: "Lato-Regular", size: 30)
        
        emailField.placeholder = "Email"
        emailField.autocapitalizationType = .none
        emailField.leftViewMode = .always
        emailField.textColor = UIColor(red: 42/255, green: 43/255, blue: 43/255, alpha: 1)
        emailField.font = UIFont(name: "Lato-Regular", size: 18)
        emailField.autocorrectionType = .no
        
        emailboxImage1.image = UIImage(named: "TypingBox")
        passwordboxImage.image = UIImage(named: "TypingBox")
        
        passwordField.placeholder = "Пароль"
        passwordField.autocapitalizationType = .none
        passwordField.leftViewMode = .always
        passwordField.font = UIFont(name: "Lato-Regular", size: 18)
        passwordField.autocorrectionType = .no
        passwordField.isSecureTextEntry.toggle() //делает пароль невидимым
        
        [emailField, labelLogIn, passwordField, loginButton, signupButton, emailboxImage1, passwordboxImage, clyacsaImage].forEach { view.addSubview($0) }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        labelLogIn.pin
            .hCenter()
            .bottom(541)
            .sizeToFit()
        
        emailField.pin
            .hCenter()
            .bottom(461)
            .width(245)
            .height(50)
        
        emailboxImage1.pin
            .width(280)
            .height(50)
            .hCenter()
            .bottom(461)
        
        passwordboxImage.pin
            .width(280)
            .height(50)
            .hCenter()
            .bottom(391)
        
        passwordField.pin
            .hCenter()
            .bottom(391)
            .width(245)
            .height(50)
        
        loginButton.pin
            .hCenter()
            .bottom(278)
            .width(220)
            .height(50)
        
        signupButton.pin
            .bottom(138)
            .hCenter()
            .height(50)
            .width(290)
        
        clyacsaImage.pin
            .width(414)
            .height(189)
            .above(of: labelLogIn).marginVertical(130)
            .hCenter()
    }
    
    @objc
    private func logInButtonPressed() {

            let email = emailField.text
            let password = passwordField.text

        output.logInButtonPressed(email: email, password: password)
    }
    
    @objc
    private func toSignUpButtonPressed() {
        output.toSignUpButtonPressed()
    }
}


extension LogInViewController: LogInViewInput {
    
}
