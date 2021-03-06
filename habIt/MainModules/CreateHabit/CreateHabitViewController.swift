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
    private let unitsBoxImage = UIImageView(image: UIImage(named: "goalbox"))
    private let untilBoxImage = UIImageView(image: UIImage(named: "goalbox"))
    private let calendarImage = UIImageView(image: UIImage(named: "calendar"))
    private let nameField = UITextField()
    private let unitsField = UITextField() // units
    private let goalField = UITextField() // target
    private let untilField = UIDatePicker()
    private let upperLable = UILabel()
    private let goalLable = UILabel()
    private let weekLable = UILabel()
    private let timelimitLable = UILabel()      //"Период выполнения"
    private let untilLable = UILabel()      //"До"
    private let iconchangeButton = UIButton()
    static let colorcircleView = UIImageView()
    static let iconView = UIImageView()
    private let colorchangeButton = UIButton()
    private let mondayButton = UIButton()
    private let tuesdayButton = UIButton()
    private let wednesdayButton = UIButton()
    private let thursdayButton = UIButton()
    private let fridayButton = UIButton()
    private let saturdayButton = UIButton()
    private let sundayButton = UIButton()
    private let createButton = UIButton()
    private let untilSwitch = UISwitch()
    
    
    // 1-воскресенье, 2-понедельник, 3-вторник и тд
    private var days = [2:false, 3:false, 4:false, 5:false, 6:false, 7:false, 1:false]
    private var habitDays: [Int] = []
    
    private var creationDate = calendar.dateComponents([.day], from: startDate, to: date).day!
    private var untilDate = calendar.dateComponents([.day], from: startDate, to: date).day!
    
    private var habitProgress = [String: Int]()
    
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
        untilField.minimumDate = Date()
        creationDate = calendar.dateComponents([.day], from: startDate, to: date).day!
        untilDate = creationDate
        
        for day in creationDate...untilDate {
            habitProgress[String(day)] = 0
        }
        
        view.backgroundColor = UIColor(named: "Background1")
        
        untilSwitch.tintColor = UIColor(red: 182/255, green: 230/255, blue: 255/255, alpha: 1)
        untilSwitch.onTintColor = UIColor(red: 182/255, green: 230/255, blue: 255/255, alpha: 1)
        untilSwitch.backgroundColor = UIColor(red: 234/255, green: 246/255, blue: 252/255, alpha: 1)
        untilSwitch.layer.cornerRadius = 16
        untilSwitch.isOn = true
        untilSwitch.addTarget(self, action: #selector(switchChanged), for: UIControl.Event.valueChanged)
        
        
        upperLable.text = "Создание привычки"
        upperLable.font = UIFont(name: "Lato-Bold", size: 20)
        
        untilLable.text = "До"
        untilLable.font = UIFont(name: "Lato-Regular", size: 18)
        
        nameField.placeholder = "Название"
        nameField.font = UIFont(name: "Lato-Regular", size: 18)
        nameField.delegate = self
        
        [mondayButton, tuesdayButton, wednesdayButton, thursdayButton, fridayButton, saturdayButton, sundayButton].forEach {
            $0.backgroundColor = UIColor(red: 238/255, green: 246/255, blue: 251/255, alpha: 1)
            $0.layer.cornerRadius = 7
            $0.frame.size.height = 40
            $0.frame.size.width = 40
            $0.titleLabel?.font = UIFont(name: "Lato-Regular", size: 18)
            $0.setTitleColor(UIColor(red: 48/255, green: 48/255, blue: 48/255, alpha: 1), for: .normal)
        }
        
        mondayButton.setTitle("Пн", for: .normal)
        mondayButton.addTarget(self, action: #selector(dayButtonPressed), for: .touchUpInside)
        
        tuesdayButton.setTitle("Вт", for: .normal)
        tuesdayButton.addTarget(self, action: #selector(dayButtonPressed), for: .touchUpInside)
        
        wednesdayButton.setTitle("Ср", for: .normal)
        wednesdayButton.addTarget(self, action: #selector(dayButtonPressed), for: .touchUpInside)
        
        thursdayButton.setTitle("Чт", for: .normal)
        thursdayButton.addTarget(self, action: #selector(dayButtonPressed), for: .touchUpInside)
        
        fridayButton.setTitle("Пт", for: .normal)
        fridayButton.addTarget(self, action: #selector(dayButtonPressed), for: .touchUpInside)
        
        saturdayButton.setTitle("Сб", for: .normal)
        saturdayButton.addTarget(self, action: #selector(dayButtonPressed), for: .touchUpInside)
        
        sundayButton.setTitle("Вс", for: .normal)
        sundayButton.addTarget(self, action: #selector(dayButtonPressed), for: .touchUpInside)
        
        
        createButton.setTitle("Создать", for: .normal)
        createButton.titleLabel?.font = UIFont(name: "Lato-Medium", size: 20)
        createButton.backgroundColor = UIColor(red: 182/255, green: 230/255, blue: 255/255, alpha: 1)
        createButton.layer.cornerRadius = 10
        createButton.setTitleColor(UIColor(red: 48/255, green: 48/255, blue: 48/255, alpha: 1), for: .normal)
        createButton.addTarget(self, action: #selector(createHabitButtonPressed), for: .touchUpInside)
        
        unitsField.placeholder = "Ед. измерения"
        unitsField.font = UIFont(name: "Lato-Regular", size: 18)
        unitsField.delegate = self
        
        goalField.placeholder = "Количество"
        goalField.font = UIFont(name: "Lato-Regular", size: 18)
        goalField.keyboardType = .numberPad
        goalField.delegate = self
        
        untilField.timeZone = .current
        untilField.datePickerMode = .date
        untilField.tintColor = UIColor.black
        untilField.addTarget(self, action: #selector(untilDateChanged), for: .valueChanged)
        
        iconchangeButton.backgroundColor = UIColor(red: 238/255, green: 246/255, blue: 251/255, alpha: 1)
        iconchangeButton.layer.cornerRadius = 5
        iconchangeButton.addTarget(self, action: #selector(iconchangeButtonPressed), for: .touchUpInside)
        
        colorchangeButton.backgroundColor = UIColor(red: 238/255, green: 246/255, blue: 251/255, alpha: 1)
        colorchangeButton.layer.cornerRadius = 5
        colorchangeButton.addTarget(self, action: #selector(colorchangeButtonPressed), for: .touchUpInside)
        
        CreateHabitViewController.colorcircleView.backgroundColor = UIColor(red: 254/255, green: 194/255, blue: 76/255, alpha: 1)
        CreateHabitViewController.colorcircleView.layer.cornerRadius = 18
        
        CreateHabitViewController.iconView.image = UIImage(named: "task")
        CreateHabitViewController.iconView.tintColor = UIColor(red: 254/255, green: 194/255, blue: 76/255, alpha: 1)
        
        goalLable.text = "Цель"
        goalLable.font = UIFont(name: "Lato-Medium", size: 20)
        
        weekLable.text = "Дни выполнения"
        weekLable.font = UIFont(name: "Lato-Medium", size: 20)
        
        timelimitLable.text = "Период выполнения"
        timelimitLable.font = UIFont(name: "Lato-Medium", size: 20)
        
        
        [untilSwitch, createButton, timelimitLable, untilBoxImage, untilLable, mondayButton, untilField, tuesdayButton, wednesdayButton, thursdayButton, fridayButton, saturdayButton, sundayButton, goalBoxImage, unitsBoxImage, weekLable, goalLable, colorchangeButton, CreateHabitViewController.colorcircleView, iconchangeButton, CreateHabitViewController.iconView, nameBoxImage, upperLable, nameField, unitsField, goalField, calendarImage].forEach {view.addSubview($0)}
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let smallSpace = (view.frame.height - 483)/13
        let bigSpace = smallSpace+7
        
        upperLable.pin
            .top(33)
            .sizeToFit()
            .hCenter()
        
        nameBoxImage.pin
            .height(50)
            .left(32)
            .right(32)
            .below(of: upperLable).marginVertical(smallSpace)
        
        nameField.pin
            .height(50)
            .left(to: nameBoxImage.edge.left).margin(15)
            .right(to: nameBoxImage.edge.right).margin(15)
            .below(of: upperLable).marginVertical(smallSpace)
        
        colorchangeButton.pin
            .height(60)
            .width(60)
            .below(of: nameBoxImage).marginVertical(bigSpace)
            .right(97)
        
        CreateHabitViewController.colorcircleView.pin
            .height(36)
            .width(36)
            .before(of: colorchangeButton).marginHorizontal(-48)
            .above(of: colorchangeButton).marginVertical(-48)
        
        iconchangeButton.pin
            .height(60)
            .width(60)
            .below(of: nameBoxImage).marginVertical(bigSpace)
            .left(97)
        
        CreateHabitViewController.iconView.pin
            .height(36)
            .width(36)
            .before(of: iconchangeButton).marginHorizontal(-48)
            .above(of: iconchangeButton).marginVertical(-48)
        
        goalLable.pin
            .below(of: iconchangeButton).marginVertical(bigSpace)
            .before(of: iconchangeButton).marginHorizontal(15)
            .sizeToFit()
        
        goalBoxImage.pin
            .height(50)
            .width((view.frame.width/2)-7.5-40)
            .left(40)
            .below(of: goalLable).marginVertical(smallSpace)
        
        unitsBoxImage.pin
            .height(50)
            .width((view.frame.width/2)-7.5-40)
            .right(40)
            .below(of: goalLable).marginVertical(smallSpace)
        
        unitsField.pin
            .height(50)
            .width((view.frame.width/2)-7.5-55)
            .left(to: unitsBoxImage.edge.left).margin(10)
            .below(of: goalLable).marginVertical(smallSpace)

        goalField.pin
            .height(50)
            .left(to: goalBoxImage.edge.left).margin(10)
            .width((view.frame.width/2)-7.5-55)
            .below(of: goalLable).marginVertical(smallSpace)
        
        weekLable.pin
            .left(35)
            .sizeToFit()
            .below(of: goalBoxImage).marginVertical(35)
        
        [mondayButton, tuesdayButton, wednesdayButton, thursdayButton, fridayButton, saturdayButton, sundayButton].forEach {
            $0.pin
                .below(of: weekLable).marginVertical(bigSpace)
        }
        
        let placeBetweenDays = (view.frame.width-68-280)/6
        mondayButton.pin
            .left(34)
        tuesdayButton.pin
            .after(of: mondayButton).marginLeft(placeBetweenDays)
        wednesdayButton.pin
            .after(of: tuesdayButton).marginLeft(placeBetweenDays)
        thursdayButton.pin
            .after(of: wednesdayButton).marginLeft(placeBetweenDays)
        fridayButton.pin
            .after(of: thursdayButton).marginLeft(placeBetweenDays)
        saturdayButton.pin
            .after(of: fridayButton).marginLeft(placeBetweenDays)
        sundayButton.pin
            .after(of: saturdayButton).marginLeft(placeBetweenDays)
        
        timelimitLable.pin
            .left(35)
            .below(of: mondayButton).marginVertical(bigSpace)
            .sizeToFit()
        
        untilSwitch.pin
            .centerLeft(to: timelimitLable.anchor.centerRight).margin(10)
            .below(of: mondayButton).marginVertical(43)
        
        untilLable.pin
            .below(of: timelimitLable).marginVertical(bigSpace+4)
            .sizeToFit()
            .left(61)
        
        untilBoxImage.pin
            .height(50)
            .width(170)
            .after(of: untilLable).marginLeft(20)
            .below(of: timelimitLable).marginVertical(smallSpace)
        
        untilField.pin
            .height(50)
            .width(130)
            .below(of: timelimitLable).marginVertical(smallSpace)
            .after(of: untilLable).marginLeft(25)
        
        calendarImage.pin
            .below(of: untilBoxImage).margin(-37)
            .after(of: untilBoxImage).marginHorizontal(-32)
            .height(24)
            .width(24)
        
        createButton.pin
            .height(50)
            .width(160)
            .hCenter()
            .bottom(50)
    }
    
    @objc
    private func switchChanged() {
        if untilSwitch.isOn {
            untilLable.isHidden = false
            untilField.isHidden = false
            untilBoxImage.isHidden = false
            calendarImage.isHidden = false
            
        } else {
            untilLable.isHidden = true
            untilField.isHidden = true
            untilBoxImage.isHidden = true
            calendarImage.isHidden = true
            
            untilDate = 20000
            
            for day in creationDate...untilDate {
                habitProgress[String(day)] = 0
            }
        }
        
    }
    
    @objc
    private func colorchangeButtonPressed() {
        output.colorchangeButtonPressed()
    }
    
    @objc
    private func iconchangeButtonPressed() {
        output.iconchangeButtonPressed()
    }
    
    @objc
    private func dayButtonPressed (_ sender: UIButton) {
        if sender.backgroundColor == UIColor(red: 182/255, green: 230/255, blue: 255/255, alpha: 1) {
            sender.backgroundColor = UIColor(red: 238/255, green: 246/255, blue: 251/255, alpha: 1)
        } else {
            sender.backgroundColor = UIColor(red: 182/255, green: 230/255, blue: 255/255, alpha: 1)
        }
        
        switch sender {
        case mondayButton:
            saveDay(day: 2)
        case tuesdayButton:
            saveDay(day: 3)
        case wednesdayButton:
            saveDay(day: 4)
        case thursdayButton:
            saveDay(day: 5)
        case fridayButton:
            saveDay(day: 6)
        case saturdayButton:
            saveDay(day: 7)
        case sundayButton:
            saveDay(day: 1)
        default:
            print("all buttions selected")
        }
        
    }
    
    func saveDay(day: Int) {
        if days[day] == true {
            days[day] = false
            habitDays = habitDays.filter{$0 != day}
        } else {
            days[day] = true
            habitDays.append(day)
        }
    }
    
    
    @objc
    private func untilDateChanged(_ sender: UIDatePicker) {
        untilDate = sender.calendar.dateComponents([.day], from: startDate, to: untilField.date).day!
        
        for day in creationDate...untilDate {
            habitProgress[String(day)] = 0
        }
    }
    
    @objc
    private func createHabitButtonPressed() {
        
        if nameField.hasText == false || goalField.hasText == false || unitsField.hasText == false || habitDays.isEmpty == true {
            print("something is empty")
            output.showAlert()
            
        } else {
            
            let creationDate = self.creationDate
            let untilDate = self.untilDate
            let title = self.nameField.text! //проверка
            let imageName = IconPickerViewController.iconName
            let habitColor = ColorPickerViewController.rgbColor.map {Double($0)}
            let target = self.goalField.text! //проверка
            let units = self.unitsField.text! //проверка
            let habitDays = self.habitDays //проверка
            let habitProgress = self.habitProgress
            
            output.createHabitButtonPressed(creationDate: creationDate, untilDate: untilDate, title: title, imageName: imageName, habitColor: habitColor, target: target, units: units, habitDays: habitDays, habitProgress: habitProgress)
            
        }
        
        IconPickerViewController.selectedIcon = UIImage(named: "task")
        ColorPickerViewController.habitColor = UIColor(red: 254/255, green: 194/255, blue: 76/255, alpha: 1)
    }
    
}

extension CreateHabitViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        switch textField {
        case nameField:
            if ((textField.text?.count)! + (string.count - range.length)) > 18 {
                return false
            }
            
        case unitsField:
            if ((textField.text?.count)! + (string.count - range.length)) > 13 {
                return false
            }
            
        case goalField:
            if ((textField.text?.count)! + (string.count - range.length)) > 6 {
                return false
            }
        
        default:
            return true
        }
        
        return true
        
    }
}

extension CreateHabitViewController: CreateHabitViewInput {
}


