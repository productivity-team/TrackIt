//
//  ViewController.swift
//  habIt
//
//  Created by kjhfsjdgfhk on 21.03.2021.
//

import UIKit
import PinLayout
import FirebaseAuth
import Foundation

class LogInViewController: UIViewController {
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
        loginButton.setTitle("Войти", for: .normal)
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
        signupButton.addTarget(self, action: #selector(toSignupButtonPressed), for: .touchUpInside)
        
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
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
    }
    
    
    //перемещает курсор в поле емэйла чтобы лишний раз туда не тыкать
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if FirebaseAuth.Auth.auth().currentUser != nil {
            emailField.becomeFirstResponder()
        }
    }
    
    
    // выход из профиля (переписать + на главную)
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
    
    
    // функция которая логинит пользователя при нажатии на кнопку войти и выкидывает поп ап при ошибке
    // !!!!!!!добавить переход на главный экран!!!!!!!
    @objc
    private func loginButtonPressed() {
        if let email = emailField.text, let password = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult,error in
                if let err = error {
                    self.showAlert(message: err.localizedDescription)
                } else {
                    //Navigate to the main view controller
                    print("You have signed in")
                }
            }
        }
    }
        
        
        
        
        //        signoutButton.pin
        //            .bottom(view.pin.safeArea.bottom + 16)
        //            .horizontally(16)
        //            .height(48)
        //
        
        
        
        
        // переписать на экране создания пользователя (создание аккаунта)
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
        
    
    //переход на экран регистрации при нажатии кнопки
    @objc func toSignupButtonPressed() {
        //let signUpVC = MainView()
        let signUpVC = SignUpViewController()
        signUpVC.modalPresentationStyle = .fullScreen
        present(signUpVC, animated: true, completion: nil)
    }
    
    //показывает pop up window с ошибкой
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
