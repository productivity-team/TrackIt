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
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 8
        loginButton.layer.masksToBounds = true
        loginButton.setTitle("Log in", for: .normal)
        loginButton.backgroundColor = .black
        
        signoutButton.layer.cornerRadius = 8
        signoutButton.layer.masksToBounds = true
        signoutButton.setTitle("Log out", for: .normal)
        signoutButton.backgroundColor = .black
        
        
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
        
        
        signupButton.layer.cornerRadius = 8
        signupButton.layer.masksToBounds = true
        signupButton.setTitle("Sign up", for: .normal)
        signupButton.backgroundColor = .black
        
        
        
        
        
        
        labelLogIn.text = "Log in"
        labelLogIn.font = .systemFont(ofSize: 28)
        
        emailField.placeholder = "Email"
        emailField.layer.borderWidth = 2
        emailField.backgroundColor = .lightGray
        emailField.autocapitalizationType = .none
        emailField.leftViewMode = .always
        emailField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        
        
        passwordField.placeholder = "Password"
        passwordField.layer.borderWidth = 2
        passwordField.backgroundColor = .lightGray
        passwordField.autocapitalizationType = .none
        passwordField.leftViewMode = .always
        passwordField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        
    
        [emailField, labelLogIn, passwordField, loginButton, signupButton].forEach { view.addSubview($0) }
        
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
            .center()
            .sizeToFit()
        
        emailField.pin
            .below(of: labelLogIn, aligned: .center)
            .width(80%)
            .height(50)
        
        passwordField.pin
            .below(of: emailField, aligned: .center)
            .marginTop(5)
            .width(of: emailField)
            .height(50)
        
        loginButton.pin
            .bottom(view.pin.safeArea.bottom + 16)
            .horizontally(16)
            .height(48)
        
        signoutButton.pin
            .bottom(view.pin.safeArea.bottom + 16)
            .horizontally(16)
            .height(48)
        
        signupButton.pin
            .above(of: loginButton)
            .marginBottom(15)
            .horizontally(16)
            .height(48)

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

