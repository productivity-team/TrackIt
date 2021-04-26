//
//  CreateHabitViewController.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 22.04.2021.
//  
//

import UIKit

final class CreateHabitViewController: UIViewController {
	private let output: CreateHabitViewOutput
    
    private let nameBoxImage = UIImageView(image: UIImage(named: "namebox"))
    private let goalBoxImage = UIImageView(image: UIImage(named: "goalbox"))
    private let untilBoxImage = UIImageView(image: UIImage(named: "goalbox"))
    private let calendarImage = UIImageView(image: UIImage(named: "calendar"))
    private let nameField = UITextField()
    private let goalField = UITextField()
    private let untilField = UITextField()
    private let upperLable = UILabel()
    private let goalLable = UILabel()
    private let weekLable = UILabel()
    private let timelimitLable = UILabel()      //"Период выполнения"
    private let untilLable = UILabel()      //"До"
    private let iconchangeButton = UIButton()
    private let colorchangeButton = UIButton()
    private let mondayButton = UIButton()
    private let tuesdayButton = UIButton()
    private let wednesdayButton = UIButton()
    private let thursdayButton = UIButton()
    private let fridayButton = UIButton()
    private let saturdayButton = UIButton()
    private let sundayButton = UIButton()
    private let createButton = UIButton()
    private let goalSwitch = UISwitch()
    private let untilSwitch = UISwitch()

    init(output: CreateHabitViewOutput) {
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
        
        [goalSwitch, untilSwitch].forEach{
            $0.tintColor = UIColor(red: 182/255, green: 230/255, blue: 255/255, alpha: 1)
            $0.onTintColor = UIColor(red: 182/255, green: 230/255, blue: 255/255, alpha: 1)
            $0.backgroundColor = UIColor(red: 234/255, green: 246/255, blue: 252/255, alpha: 1)
            $0.layer.cornerRadius = 16
        }
        
        upperLable.text = "Создание привычки"
        upperLable.font = UIFont(name: "Lato-Bold", size: 20)
        
        untilLable.text = "До"
        untilLable.font = UIFont(name: "Lato-Regular", size: 18)
        
        nameField.placeholder = "Название"
        nameField.font = UIFont(name: "Lato-Regular", size: 18)
        
        [mondayButton, tuesdayButton, wednesdayButton, thursdayButton, fridayButton, saturdayButton, sundayButton].forEach {
            $0.backgroundColor = UIColor(red: 182/255, green: 230/255, blue: 255/255, alpha: 1)
            $0.layer.cornerRadius = 7
            $0.frame.size.height = 40
            $0.frame.size.width = 40
            $0.titleLabel?.font = UIFont(name: "Lato-Regular", size: 18)
            $0.setTitleColor(UIColor(red: 48/255, green: 48/255, blue: 48/255, alpha: 1), for: .normal)
        }
        
        mondayButton.setTitle("Пн", for: .normal)
        tuesdayButton.setTitle("Вт", for: .normal)
        wednesdayButton.setTitle("Ср", for: .normal)
        thursdayButton.setTitle("Чт", for: .normal)
        fridayButton.setTitle("Пт", for: .normal)
        saturdayButton.setTitle("Сб", for: .normal)
        sundayButton.setTitle("Вс", for: .normal)
        
        createButton.setTitle("Создать", for: .normal)
        createButton.titleLabel?.font = UIFont(name: "Lato-Medium", size: 20)
        createButton.backgroundColor = UIColor(red: 182/255, green: 230/255, blue: 255/255, alpha: 1)
        createButton.layer.cornerRadius = 10
        createButton.setTitleColor(UIColor(red: 48/255, green: 48/255, blue: 48/255, alpha: 1), for: .normal)
        
        goalField.placeholder = "0"
        goalField.font = UIFont(name: "Lato-Regular", size: 18)
        
        untilField.placeholder = "ДД.ММ.ГГ"
        untilField.font = UIFont(name: "Lato-Regular", size: 18)
        
        iconchangeButton.backgroundColor = UIColor(red: 182/255, green: 230/255, blue: 255/255, alpha: 1)
        iconchangeButton.layer.cornerRadius = 5
        
        colorchangeButton.backgroundColor = UIColor(red: 182/255, green: 230/255, blue: 255/255, alpha: 1)
        colorchangeButton.layer.cornerRadius = 5
        colorchangeButton.addTarget(self, action: #selector(colorchangeButtonPressed), for: .touchUpInside)
        
        goalLable.text = "Цель"
        goalLable.font = UIFont(name: "Lato-Medium", size: 20)
        
        weekLable.text = "Частота"
        weekLable.font = UIFont(name: "Lato-Medium", size: 20)
        
        timelimitLable.text = "Период выполнения"
        timelimitLable.font = UIFont(name: "Lato-Medium", size: 20)
    
        
        [untilSwitch, createButton, timelimitLable, untilBoxImage, untilLable, mondayButton, untilField, tuesdayButton, wednesdayButton, thursdayButton, fridayButton, saturdayButton, sundayButton, goalBoxImage, weekLable, goalLable, colorchangeButton, iconchangeButton ,nameBoxImage, upperLable, nameField, goalField, calendarImage, goalSwitch].forEach {view.addSubview($0)}
	}

    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
        
        upperLable.pin
            .top(33)
            .sizeToFit()
            .hCenter()
        
        nameBoxImage.pin
            .height(50)
            .width(350)
            .below(of: upperLable).marginVertical(25)
            .hCenter()
        
        nameField.pin
            .height(50)
            .width(320)
            .below(of: upperLable).marginVertical(25)
            .hCenter()
        
        colorchangeButton.pin
            .height(60)
            .width(60)
            .below(of: nameBoxImage).marginVertical(35)
            .right(97)
        
        iconchangeButton.pin
            .height(60)
            .width(60)
            .below(of: nameBoxImage).marginVertical(35)
            .left(97)
        
        goalLable.pin
            .below(of: iconchangeButton).marginVertical(35)
            .before(of: iconchangeButton).marginHorizontal(15)
            .sizeToFit()
        
        goalSwitch.pin
            .after(of: goalLable).margin(15)
            .below(of: iconchangeButton).marginVertical(32)
        
        goalBoxImage.pin
            .height(50)
            .width(160)
            .right(47)
            .below(of: goalLable).marginVertical(25)
        
        goalField.pin
            .height(50)
            .width(130)
            .right(62)
            .below(of: goalLable).marginVertical(25)
        
        weekLable.pin
            .left(35)
            .sizeToFit()
            .below(of: goalBoxImage).marginVertical(35)
        
        [mondayButton, tuesdayButton, wednesdayButton, thursdayButton, fridayButton, saturdayButton, sundayButton].forEach {
            $0.pin
                .below(of: weekLable).marginVertical(25)
        }
        
        mondayButton.pin
            .left(34)
        tuesdayButton.pin
            .after(of: mondayButton).marginLeft(11)
        wednesdayButton.pin
            .after(of: tuesdayButton).marginLeft(11)
        thursdayButton.pin
            .after(of: wednesdayButton).marginLeft(11)
        fridayButton.pin
            .after(of: thursdayButton).marginLeft(11)
        saturdayButton.pin
            .after(of: fridayButton).marginLeft(11)
        sundayButton.pin
            .after(of: saturdayButton).marginLeft(11)
        
        timelimitLable.pin
            .left(35)
            .below(of: mondayButton).marginVertical(45)
            .sizeToFit()
        
        untilSwitch.pin
            .after(of: timelimitLable).marginHorizontal(15)
            .below(of: mondayButton).marginVertical(43)
        
        untilLable.pin
            .below(of: timelimitLable).marginVertical(39)
            .sizeToFit()
            .left(61)
        
        untilBoxImage.pin
            .height(50)
            .width(160)
            .after(of: untilLable).marginLeft(20)
            .top(579)
        
        untilField.pin
            .height(50)
            .width(130)
            .below(of: timelimitLable).marginVertical(25)
            .after(of: untilLable).marginLeft(35)
        
        calendarImage.pin
            .below(of: untilBoxImage).margin(-37)
            .after(of: untilBoxImage).margin(-37)
            .height(24)
            .width(24)
        
        createButton.pin
            .height(50)
            .width(160)
            .hCenter()
            .below(of: untilBoxImage).margin(89)
    }
    
    @objc
    private func colorchangeButtonPressed() {
        output.colorchangeButtonPressed()
    }
    
}

extension CreateHabitViewController: CreateHabitViewInput {
}


