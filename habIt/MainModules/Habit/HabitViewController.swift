
//
//  HabitViewController.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 22.04.2021.
//
//

import UIKit


final class HabitViewController: UIViewController {
    private let output: HabitViewOutput
    private let unitsboxImage = UIImageView(image: UIImage(named: "textbox"))
    private let topbarImage = UIImageView(image: UIImage(named: "topbar"))

    private let habitName = UILabel() //название привычки
    private let completionsLabel = UILabel() //сколько выполнено
    private let dividerLabel = UILabel() // "из"
    private let targetLabel = UILabel() //цель привычки
    private let unitsLabel = UILabel() //единицы измерения
    private let settingsiconButton = UIButton() //редактировать привычку
    private let unitsField = UITextField() //textfield для добавления прогресса
    private let addButton = UIButton() //кнопка добавления прогресса
    private let resetButton = UIButton() //кнопка сброса прогресса
    private let circularProgress = CircularProgress(frame: CGRect(x: 10.0, y: 30.0, width: 305.0, height: 305.0))
    private let screenColor = UIColor(red: 0/255, green: 230/255, blue: 190/255, alpha: 1)
    
    private var numberOfCompletions = 0
    private let target = 100
    
    static var tappedHabitName = ""

    
    
    init(output: HabitViewOutput) {
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
        
        habitName.text = output.getTitle()
        habitName.font = UIFont(name: "Lato-Regular", size: 25)
        
        
        circularProgress.progressColor = screenColor
        circularProgress.trackColor = UIColor.lightGray
        circularProgress.tag = 101
        circularProgress.center = self.view.center
        
        //animate progress
        self.perform(#selector(animateProgress), with: nil, afterDelay: 0.3)
        
        numberOfCompletions = Int(output.getNumberOfCompletions()) ?? 0
        completionsLabel.text = String(numberOfCompletions)
        completionsLabel.textColor = screenColor
        completionsLabel.font = UIFont(name: "Lato-Bold", size: 35)
        completionsLabel.sizeToFit()

        
        dividerLabel.text = "из"
        dividerLabel.textColor = screenColor
        dividerLabel.font = UIFont(name: "Lato-Bold", size: 35)
        
        targetLabel.text = output.getTarget()
        targetLabel.textColor = screenColor
        targetLabel.font = UIFont(name: "Lato-Bold", size: 35)
        
        addButton.setTitle("Добавить", for: .normal)
        addButton.titleLabel?.font = UIFont(name: "Lato-Medium", size: 20)
        addButton.backgroundColor = UIColor(red: 182/255, green: 230/255, blue: 255/255, alpha: 1)
        addButton.layer.cornerRadius = 10
        addButton.setTitleColor(UIColor(red: 48/255, green: 48/255, blue: 48/255, alpha: 1), for: .normal)
        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        
        resetButton.setTitle("Сбросить прогресс", for: .normal)
        resetButton.titleLabel?.font = UIFont(name: "Lato-Medium", size: 15)
        resetButton.setTitleColor(UIColor(red: 123/255, green: 124/255, blue: 124/255, alpha: 1), for: .normal)
        resetButton.addTarget(self, action: #selector(resetButtonPressed), for: .touchUpInside)
        
        settingsiconButton.setImage(UIImage(named: "pencil"), for: .normal)
        settingsiconButton.tintColor = screenColor
        
        unitsField.placeholder = "0"
        unitsField.textColor = UIColor(named: "Text")
        unitsField.font = UIFont(name: "Lato-Regular", size: 18)
        unitsField.keyboardType = .numberPad
        
        unitsLabel.text = output.getUnits()
        unitsLabel.textColor = UIColor(named: "Green")
        unitsLabel.font = UIFont(name: "Lato-Medium", size: 22)
        
        
        
        let backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(toMenuButtonPressed))
        backBarButtonItem.tintColor = UIColor(named: "Text")
        self.navigationItem.leftBarButtonItem  = backBarButtonItem
        
        let saveBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(saveProgressButtonPressed))
        saveBarButtonItem.tintColor = UIColor(named: "Text")
        self.navigationItem.rightBarButtonItem  = saveBarButtonItem
        
        
        [topbarImage, habitName, circularProgress, completionsLabel, dividerLabel, targetLabel, unitsLabel, unitsboxImage, unitsField, addButton, resetButton, settingsiconButton].forEach{view.addSubview($0)}
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        let doneNumber = Float(output.getNumberOfCompletions()) ?? 0
        let targetNumber = Float(output.getTarget()) ?? 1
        let percentCompleted = doneNumber/targetNumber
        animateProgress(progress: percentCompleted)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        topbarImage.pin
            .top()
            .hCenter()
            .height(92)
            .width(440)
        
        circularProgress.pin
            .top(277)
            .left(55)
            .sizeToFit()
        
        habitName.pin
            .top(190)
            .hCenter()
            .sizeToFit()
        
        dividerLabel.pin
            .top(402)
            .hCenter()
            .sizeToFit()
        
        completionsLabel.pin
            .top(402)
            .before(of: dividerLabel).marginHorizontal(6)
            .sizeToFit()
        
        targetLabel.pin
            .top(402)
            .after(of: dividerLabel).marginHorizontal(6)
            .sizeToFit()

        unitsLabel.pin
            .top(450)
            .hCenter()
            .sizeToFit()
        
        unitsboxImage.pin
            .top(658)
            .left(82)
            .height(50)
            .width(105)
        
        unitsField.pin
            .top(658)
            .left(96)
            .height(50)
            .width(75)
        
        addButton.pin
            .height(50)
            .width(118)
            .top(658)
            .right(82)
        
        resetButton.pin
            .top(732)
            .height(18)
            .width(145)
            .hCenter()
        
        settingsiconButton.pin
            .right(40)
            .bottom(40)
            .height(35)
            .width(35)
    }
    
    @objc func addButtonPressed() {
        if unitsField.hasText == false {
            print("field is empty")
            output.showAlert()
        } else {
            
            numberOfCompletions += Int(unitsField.text!)!
            completionsLabel.text = String(numberOfCompletions)
            completionsLabel.sizeToFit()
            let targetNumber = Float(output.getTarget()) ?? 1
            let percentCompleted = Float(numberOfCompletions)/targetNumber
            animateProgress(progress: percentCompleted)
            unitsField.text = nil
        }
    }
    
    
    @objc func resetButtonPressed() {
        if output.resetAlert() == true
        {
            let numberOfCompletions = 0
            completionsLabel.text = numberOfCompletions.description
            completionsLabel.sizeToFit()
            let percentCompleted: Float = 0
            animateProgress(progress: percentCompleted)
        }
    }
    
    
    @objc func animateProgress(progress: Float) {
        let cp = self.view.viewWithTag(101) as! CircularProgress
        cp.setProgressWithAnimation(duration: 1.0, value: progress)
    }
    
    
    @objc func toMenuButtonPressed(){
        output.toMenuButtonPressed()
    }
    
    
    @objc func saveProgressButtonPressed(){
        
        let numberOfCompletions = self.numberOfCompletions
        let tappedHabitName = HabitViewController.tappedHabitName
        let updateKey = String(diffInDays)
        
        output.saveProgressButtonPressed(tappedHabitName: tappedHabitName, updateKey: updateKey, numberOfCompletions: numberOfCompletions)
    }
    
}

extension HabitViewController: HabitViewInput {
}
