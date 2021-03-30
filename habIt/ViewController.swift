//
//  ViewController.swift
//  habIt
//
//  Created by kjhfsjdgfhk on 21.03.2021.
//

import UIKit
import PinLayout
import FirebaseAuth

class ViewController: UIViewController {
    private let containerView = UIView()
    private let labelLogIn = UILabel()
    private let emailField = UITextField()
    private let passwordField = UITextField()
    private let loginButton = UIButton()
    private let signupButton = UIButton()
    private let signoutButton = UIButton()
    private let emailboxImage1 = UIImageView()  // Овальная штуковина за надписью Email
    private let emailboxImage2 = UIImageView()
    private let forgotlabel = UILabel()  //Забыли пароль?

    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 249/255, green: 255/255, blue: 255/255, alpha: 1)
        
        loginButton.layer.cornerRadius = 25
        loginButton.layer.masksToBounds = true
        loginButton.setTitle("Создать аккаунт", for: .normal)
        loginButton.backgroundColor = UIColor(red: 134/255, green: 213/255, blue: 238/255, alpha: 1)
        loginButton.setTitleColor(UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1), for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "Lato-Regular", size: 18)
        
        
        signupButton.layer.cornerRadius = 25
        signupButton.layer.masksToBounds = true
        signupButton.setTitle("Еще нет аккаунта?", for: .normal)
        signupButton.setTitleColor(UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1), for: .normal)
        signupButton.layer.borderWidth = 3
        signupButton.layer.borderColor = CGColor(red: 77/255, green: 185/255, blue: 219/255, alpha: 1)
        signupButton.backgroundColor = UIColor(red: 249/255, green: 255/255, blue: 255/255, alpha: 1)
        signupButton.titleLabel?.font = UIFont(name: "Lato-Regular", size: 18)
        
        
        loginButton.addTarget(self, action: #selector(didTapActionButton), for: .touchUpInside)
        if FirebaseAuth.Auth.auth().currentUser != nil {
            labelLogIn.isHidden = true
            emailField.isHidden = true
            passwordField.isHidden = true
            signupButton.isHidden = true
            loginButton.isHidden = true
            
            view.addSubview(signoutButton)
            signoutButton.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
        }
        
        
        forgotlabel.text = "Забыли пароль?"
        forgotlabel.font = .systemFont(ofSize: 15)
        forgotlabel.textColor = UIColor(red: 123/255, green: 124/255, blue: 124/255, alpha: 1)
        forgotlabel.font = UIFont(name: "Lato-Regular", size: 15)
        
        
        labelLogIn.text = "Вход"
        labelLogIn.font = .systemFont(ofSize: 30)
        labelLogIn.font = UIFont(name: "Lato-Regular", size: 30)
        
        
        emailField.placeholder = "Email"
        emailField.autocapitalizationType = .none
        emailField.leftViewMode = .always
        emailField.textColor = UIColor(red: 42/255, green: 43/255, blue: 43/255, alpha: 1)
        emailField.font = UIFont(name: "Lato-Regular", size: 18)
        
        
        emailboxImage1.image = UIImage(named: "TypingBox")
        emailboxImage2.image = UIImage(named: "TypingBox")
        
        
        passwordField.placeholder = "Пароль"
        passwordField.autocapitalizationType = .none
        passwordField.leftViewMode = .always
        passwordField.font = UIFont(name: "Lato-Regular", size: 18)
        
    
        [emailField, labelLogIn, passwordField, loginButton, signupButton, emailboxImage1, emailboxImage2, forgotlabel].forEach { view.addSubview($0) }
        
    }
    
    @objc
    private func logoutTapped() {
        do {
            try FirebaseAuth.Auth.auth().signOut()
            
            labelLogIn.isHidden = false
            emailField.isHidden = false
            passwordField.isHidden = false
            signupButton.isHidden = false
            loginButton.isHidden = false
            
            signoutButton.removeFromSuperview()
            
            
        }
        catch {
            print("An error occured")
        }
    }
    
    @objc
    private func didTapActionButton() {
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty else {
            print("Missing field data")
            return
        }
         FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: {[weak self] result, error in
            guard let strongSelf = self else {
                print("You don't have an account")
                return
            }
            
            guard error == nil else {
                return
            }
            print("You have signed in")
            strongSelf.labelLogIn.isHidden = true
            strongSelf.emailField.isHidden = true
            strongSelf.passwordField.isHidden = true
            strongSelf.loginButton.isHidden = true
            
            strongSelf.emailField.resignFirstResponder()
            strongSelf.passwordField.resignFirstResponder()
        })
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if FirebaseAuth.Auth.auth().currentUser != nil {
            emailField.becomeFirstResponder()
        }
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
        
        emailboxImage2.pin
            .width(280)
            .height(50)
            .hCenter()
            .bottom(391)
        
        passwordField.pin
            .hCenter()
            .bottom(391)
            .width(245)
            .height(50)
        
        forgotlabel.pin
            .bottom(358)
            .hCenter()
            .sizeToFit()

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
        

//        signoutButton.pin
//            .bottom(view.pin.safeArea.bottom + 16)
//            .horizontally(16)
//            .height(48)
//


    }
    func createAccount(email: String, password: String) {
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: {[weak self] result, error in
            guard let strongSelf = self else {
                print("You don't have an account")
                return
            }
            
            guard error == nil else {
                print("Account creation failed")
                return
            }
            print("You have signed in")
            strongSelf.labelLogIn.isHidden = true
            strongSelf.emailField.isHidden = true
            strongSelf.passwordField.isHidden = true
            strongSelf.loginButton.isHidden = true
            
            
        })
    }


}

