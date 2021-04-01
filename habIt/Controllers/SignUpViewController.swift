//
//  SignUpViewController.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 01.04.2021.
//

import UIKit
import PinLayout
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    private let someLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 249/255, green: 255/255, blue: 255/255, alpha: 1)
        someLabel.text = "Это экран регистрации"
        someLabel.font = UIFont(name: "Lato-Regular", size: 25)
        view.addSubview(someLabel)
        
    }
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            someLabel.pin
                .center()
                .sizeToFit()
    }

    
}
