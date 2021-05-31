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
    private let logo = UIImageView(image: UIImage(named: "TrackIt"))
    private let nameLabel = UILabel()
    private let appDescription = UILabel()
    private let participantsLabel = UILabel()
    private let participantsList = UILabel()
    private let questionsLabel = UILabel()
    private let questionsEmail = UILabel()
    
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
        
        nameLabel.text = "TrackIt"
        nameLabel.font = UIFont(name: "Lato-Regular", size: 24)
        
        appDescription.frame = CGRect(x: 0, y: 0, width: 331, height: 38)
        appDescription.text = "Проект TrackIt создан в рамках курса Mail.ru Group “Разработка приложений на IOS”"
        appDescription.font = UIFont(name: "Lato-Regular", size: 16)
        appDescription.textColor = UIColor(red: 108/255, green: 121/255, blue: 129/255, alpha: 1)
        appDescription.numberOfLines = 0
        appDescription.lineBreakMode = .byWordWrapping

        participantsLabel.text = "Авторы проекта:"
        participantsLabel.font = UIFont(name: "Lato-Regular", size: 16)
        participantsLabel.textColor = UIColor(red: 108/255, green: 121/255, blue: 129/255, alpha: 1)
        
        participantsList.text = "Амелин Никита\nЗубанов Федор\nПечерицына Мария\nКостина Вероника"
        participantsList.font = UIFont(name: "Lato-Regular", size: 16)
        participantsList.textColor = UIColor(red: 108/255, green: 121/255, blue: 129/255, alpha: 1)
        participantsList.numberOfLines = 0
        participantsList.lineBreakMode = .byWordWrapping
        
        questionsLabel.text = "Для вопросов и предложений:"
        questionsLabel.font = UIFont(name: "Lato-Regular", size: 15)
        questionsLabel.textColor = UIColor(red: 108/255, green: 121/255, blue: 129/255, alpha: 1)
        
        questionsEmail.text = "mapecheritsyna@gmail.com"
        questionsEmail.font = UIFont(name: "Lato-Regular", size: 15)
        questionsEmail.textColor = UIColor(red: 73/255, green: 187/255, blue: 251/255, alpha: 1)
    
        [logOutButton, logo, nameLabel, appDescription, participantsLabel, participantsList, questionsLabel, questionsEmail].forEach {view.addSubview($0)}
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        logOutButton.pin
            .height(46)
            .horizontally(16)
            .bottom(view.pin.safeArea.bottom + 16)
        
        logo.pin
            .top(120)
            .height(150)
            .width(150)
            .hCenter()
        
        nameLabel.pin
            .height(30)
            .width(80)
            .below(of: logo)
            .hCenter()
        
        appDescription.pin
            .below(of: nameLabel).marginVertical(30)
            .hCenter()
            .sizeToFit()
        
        participantsLabel.pin
            .height(19)
            .width(124)
            .below(of: appDescription).marginVertical(30)
            .left(41)
        
        participantsList.pin
            .height(88)
            .width(159)
            .below(of: participantsLabel).marginVertical(10)
            .left(41)
        
        questionsLabel.pin
            .height(22)
            .width(265)
            .below(of: participantsList).marginVertical(100)
            .left(41)
        
        questionsEmail.pin
            .height(22)
            .width(265)
            .below(of: questionsLabel)
            .left(41)
    }
    
    @objc
    private func logOutButtonPressed() {
        output.logOutButtonPressed()
    }
}

extension SettingsViewController: SettingsViewInput {
}
