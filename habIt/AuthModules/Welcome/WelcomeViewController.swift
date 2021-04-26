//
//  WelcomeViewController.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 07.04.2021.
//  
//

import UIKit
import PinLayout

final class WelcomeViewController: UIViewController {
    private let output: WelcomeViewOutput
    
    private let greetingLabel = UILabel()
    private let habLabel = UILabel()
    private let signUpButton = UIButton()
    private let loginButton = UIButton()
    
    init(output: WelcomeViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "Background1")
        
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
        loginButton.addTarget(self, action: #selector(toLogInButtonPressed), for: .touchUpInside)
        
        
        
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
    
    @objc
    private func toLogInButtonPressed() {
        output.toLogInButtonPressed()
    }
    
    @objc
    private func toSignUpButtonPressed() {
        output.toSignUpButtonPressed()
    }
    
}

extension WelcomeViewController: WelcomeViewInput {
    
}
