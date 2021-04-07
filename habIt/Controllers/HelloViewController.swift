//
//  HelloViewController.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 01.04.2021.
//

import UIKit
import PinLayout

class HelloViewController: UIViewController {
    
    private let greetingLabel = UILabel()
    private let habLabel = UILabel()
    private let signUpButton = UIButton()
    private let loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor(red: 249/255, green: 255/255, blue: 255/255, alpha: 1)
        
        greetingLabel.text = "Вас приветствует"
        greetingLabel.font = UIFont(name: "Lato-Regular", size: 25)
        
        
        habLabel.text = "Habit Tracker!"
        habLabel.font = UIFont(name: "Lato-Medium", size: 25)
        
        
        loginButton.layer.cornerRadius = 25
        loginButton.layer.masksToBounds = true
        loginButton.setTitle("Уже зарегистрированы?", for: .normal)
        loginButton.setTitleColor(UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1), for: .normal)
        loginButton.layer.borderWidth = 3
        loginButton.layer.borderColor = CGColor(red: 77/255, green: 185/255, blue: 219/255, alpha: 1)
        loginButton.backgroundColor = UIColor(red: 249/255, green: 255/255, blue: 255/255, alpha: 1)
        loginButton.titleLabel?.font = UIFont(name: "Lato-Regular", size: 18)
        loginButton.addTarget(self, action: #selector(toLoginButtonPressed), for: .touchUpInside)
        
        
        signUpButton.layer.cornerRadius = 25
        signUpButton.layer.masksToBounds = true
        signUpButton.setTitle("Зарегистрироваться", for: .normal)
        signUpButton.backgroundColor = UIColor(red: 134/255, green: 213/255, blue: 238/255, alpha: 1)
        signUpButton.setTitleColor(UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1), for: .normal)
        signUpButton.titleLabel?.font = UIFont(name: "Lato-Regular", size: 18)
        signUpButton.addTarget(self, action: #selector(toSignUpButtonPressed), for: .touchUpInside)
        
        [greetingLabel, habLabel, signUpButton, loginButton].forEach {view.addSubview($0)}
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        greetingLabel.pin
            .hCenter()
            .sizeToFit()
            .bottom(502)
        
        habLabel.pin
            .hCenter()
            .sizeToFit()
            .below(of: greetingLabel)
        
        signUpButton.pin
            .hCenter()
            .width(290)
            .height(50)
            .bottom(338)
        
        loginButton.pin
            .hCenter()
            .width(290)
            .height(50)
            .bottom(258)
    }
    
    //переход на экран входа при нажатии кнопки
    @objc func toLoginButtonPressed() {
        let loginVC = LogInViewController()
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: true, completion: nil)
    }
    
    //переход на экран регистрации при нажатии кнопки
    @objc func toSignUpButtonPressed() {
        let signUpVC = SignUpViewController()
        signUpVC.modalPresentationStyle = .fullScreen
        present(signUpVC, animated: true, completion: nil)
    }
}

