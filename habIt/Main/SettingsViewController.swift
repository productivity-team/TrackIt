//
//  SettingsViewController.swift
//  habIt
//
//  Created by kjhfsjdgfhk on 02.04.2021.
//

import UIKit
import PinLayout
import Firebase


class SettingsViewController: UIViewController {
    private let logOutButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 249/255, green: 255/255, blue: 255/255, alpha: 1)
        title = "Настройки"
        
        
        logOutButton.layer.cornerRadius = 10
        logOutButton.layer.masksToBounds = true
        logOutButton.setTitle("Выйти из аккаунта", for: .normal)
        logOutButton.backgroundColor = .red
        logOutButton.setTitleColor(.white, for: .normal)
        logOutButton.titleLabel?.font = UIFont(name: "Lato-Regular", size: 20)
        logOutButton.addTarget(self, action: #selector(logOutButtonPressed), for: .touchUpInside)
        
        view.addSubview(logOutButton)
        
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        logOutButton.pin
            .height(46)
            .horizontally(16)
            .bottom(view.pin.safeArea.bottom + 16)
    }
    
    
    //выход из аккаунта и переход на начальный экран 
    @objc
    private func logOutButtonPressed() {
        do {
            try Auth.auth().signOut()
            let helloVC = HelloViewController()
            helloVC.modalPresentationStyle = .fullScreen
            self.present(helloVC, animated: false, completion: nil)
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
}
