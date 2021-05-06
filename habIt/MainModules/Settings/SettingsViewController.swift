//
//  SettingsViewController.swift
//  tabbar
//
//  Created by kjhfsjdgfhk on 10.04.2021.
//  
//

import UIKit
import PinLayout

final class SettingsViewController: UIViewController {
    private let logOutButton = UIButton()
    
	private let output: SettingsViewOutput

    init(output: SettingsViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        view.backgroundColor = UIColor(red: 238/255, green: 246/255, blue: 251/255, alpha: 1)
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
    
    @objc
    private func logOutButtonPressed() {
        output.logOutButtonPressed()
    }
    
}

extension SettingsViewController: SettingsViewInput {
}
