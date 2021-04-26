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
    private let habitnameLable = UILabel()
    private let progressLable = UILabel()
    private let journalLable = UILabel()
    private let unitsLable = UILabel()
    private let addLable = UILabel()
    private let unitsboxImage = UIImageView(image: UIImage(named: "textbox"))
    private let topbarImage = UIImageView(image: UIImage(named: "topbar"))
    private let iconImage = UIImageView()
    private let settingsiconButton = UIButton()
    private let subtrButton = UIButton()
//    private let closeButton = UIButton()
//    private let saveButton = UIButton()
    private let pr10Button = UIButton()
    private let pr25Button = UIButton()
    private let pr50Button = UIButton()
    private let pr75Button = UIButton()
    private let addButton = UIButton()
    private let progressbarPView = UIProgressView()
    private let unitsField = UITextField()
    private let journalField = UITextView()
    private var placeholder = "Запиши сюда свои наблюдения"

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
        
        settingsiconButton.setImage(UIImage(named: "pencil"), for: .normal)
        settingsiconButton.tintColor = UIColor(named: "Green")
        
        journalField.layer.cornerRadius = 7
        journalField.backgroundColor = UIColor(named: "Textbox")
        journalField.font = UIFont(name: "Lato-Regular", size: 18)
        journalField.textColor = UIColor(named: "Text")
        
        journalLable.text = "Дневник"
        journalLable.font = UIFont(name: "Lato-Medium", size: 20)
        journalLable.textColor = UIColor(named: "Text")
        
        [pr10Button, pr25Button, pr50Button, pr75Button].forEach{
            $0.backgroundColor = UIColor(named: "Green")    //Подкачивается из базы, лучше использовать переменную
            $0.layer.cornerRadius = 7
            $0.setTitleColor(UIColor(named: "Text"), for: .normal)
            $0.titleLabel?.font = UIFont(name: "Lato-Medium", size: 18)
        }
        
        pr10Button.setTitle("10%", for: .normal)    //Вычисляется на основе данных с базы
        
        pr25Button.setTitle("25%", for: .normal)    //Вычисляется на основе данных с базы
        
        pr50Button.setTitle("50%", for: .normal)    //Вычисляется на основе данных с базы
        
        pr75Button.setTitle("75%", for: .normal)    //Вычисляется на основе данных с базы
        
        subtrButton.setBackgroundImage(UIImage(named: "subtraction"), for: .normal)
        subtrButton.alpha = 0.2     //Меняется в зависимости от активной кнопки
        
        addButton.setBackgroundImage(UIImage(named: "addition"), for: .normal)
        addButton.alpha = 1     //Меняется в зависимости от активной кнопки
        
        unitsField.placeholder = "0"
        unitsField.textColor = UIColor(named: "Text")
        unitsField.font = UIFont(name: "Lato-Regular", size: 18)
        
        addLable.text = "Добавить"
        addLable.font = UIFont(name: "Lato-Medium", size: 20)
        addLable.textColor = UIColor(named: "Text")
        
        unitsLable.text = "Миллилитры"
        unitsLable.textColor = UIColor(named: "Green")
        unitsLable.font = UIFont(name: "Lato-Medium", size: 14)
        
        progressbarPView.progress = 400/1000    //Потом лучше использовать две переменные
        progressbarPView.progressTintColor = UIColor(named: "Green")
        progressbarPView.backgroundColor = UIColor(named: "Textbox")
        
        progressLable.text = "400/1000"     //Подкачивается из базы
        progressLable.textColor = UIColor(named: "Green")   //Подкачивается из базы, лучше использовать переменную
        progressLable.font = UIFont(name: "Lato-Bold", size: 20)
        
        iconImage.tintColor = UIColor(named: "Green")   //Подкачивается из базы, лучше использовать переменную
        iconImage.image = UIImage(named: "watericon")   //Подкачивается из базы
        
//        saveButton.setTitle(" Сохранить  ", for: .normal)
//        saveButton.titleLabel?.font = UIFont(name: "Lato-Medium", size: 18)
//        saveButton.setTitleColor(UIColor(named: "Text"), for: .normal)
//
//        closeButton.setTitle("  Закрыть", for: .normal)
//        closeButton.titleLabel?.font = UIFont(name: "Lato-Medium", size: 18)
//        closeButton.setTitleColor(UIColor(named: "Text"), for: .normal)
        
        habitnameLable.text = "Имя"    //Должно подкачиваться из базы
        habitnameLable.font = UIFont(name: "Lato-Medium", size: 18)
        habitnameLable.textColor = UIColor(named: "Text")
        
        
        let backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(toMenuButtonPressed))
        backBarButtonItem.tintColor = UIColor(named: "Text")
        self.navigationItem.leftBarButtonItem  = backBarButtonItem
        
        let saveBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(saveHabitButtonPressed))
        saveBarButtonItem.tintColor = UIColor(named: "Text")
        self.navigationItem.rightBarButtonItem  = saveBarButtonItem
        
        
        [topbarImage, habitnameLable, iconImage, progressLable, progressbarPView, unitsLable, addLable, unitsboxImage, unitsField, addButton, subtrButton, pr10Button, pr25Button, pr50Button, pr75Button, journalLable, journalField, settingsiconButton].forEach{view.addSubview($0)}
	}
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if journalField.textColor == .lightGray {
            journalField.text = ""
            journalField.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if journalField.text.isEmpty {
            journalField.text = "Запиши сюда свои наблюдения"
            journalField.textColor = UIColor.lightGray
            placeholder = ""
        }
        else{
            placeholder = journalField.text
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        placeholder = journalField.text
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    return ((journalField.text.count) > 180 && journalField.frame.size.height > 100.0) ? false : true
    }
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
        
        topbarImage.pin
            .top()
            .hCenter()
            .height(92)
            .width(440)
        
        habitnameLable.pin
            .top(52)
            .sizeToFit()
            .hCenter()
        
//        closeButton.pin
//            .left(11)
//            .height(35)
//            .width(84)
//            .top(46)
//
//        saveButton.pin
//            .right(12)
//            .height(35)
//            .width(101)
//            .top(46)
        
        iconImage.pin
            .below(of: topbarImage).marginVertical(40)
            .left(35)
            .height(40)
            .width(40)
        
        progressLable.pin
            .below(of: topbarImage).marginVertical(56)
            .right(35)
            .sizeToFit()
        
        progressbarPView.pin
            .below(of: iconImage).marginVertical(10)
            .height(5)
            .width(344)
            .hCenter()
        
        unitsLable.pin
            .below(of: progressbarPView).marginVertical(2)
            .right(35)
            .sizeToFit()
        
        addLable.pin
            .left(35)
            .below(of: progressbarPView).marginVertical(30)
            .sizeToFit()
        
        unitsboxImage.pin
            .below(of: addLable).marginVertical(25)
            .after(of: addLable).marginHorizontal(-45)
            .height(50)
            .width(105)
        
        unitsField.pin
            .height(50)
            .width(75)
            .below(of: addLable).marginVertical(25)
            .after(of: addLable).marginHorizontal(-30)
        
        addButton.pin
            .height(35)
            .width(35)
            .after(of: unitsboxImage).marginHorizontal(36)
            .above(of: unitsboxImage).marginVertical(-43)
        
        subtrButton.pin
            .height(35)
            .width(35)
            .after(of: addButton).marginHorizontal(20)
            .above(of: unitsboxImage).marginVertical(-43)
        
        [pr10Button, pr25Button, pr75Button, pr50Button].forEach{
            $0.pin
                .height(50)
                .width(120)
        }
        
        pr10Button.pin
            .below(of: unitsboxImage).marginVertical(45)
            .left(67)
        
        pr25Button.pin
            .below(of: unitsboxImage).marginVertical(45)
            .right(67)
        
        pr50Button.pin
            .below(of: pr10Button).marginVertical(30)
            .left(67)
        
        pr75Button.pin
            .below(of: pr25Button).marginVertical(30)
            .right(67)
        
        journalLable.pin
            .sizeToFit()
            .below(of: pr50Button).marginVertical(30)
            .left(35)
        
        journalField.pin
            .below(of: journalLable).marginVertical(25)
            .left(35)
            .height(100)
            .width(344)
        
        settingsiconButton.pin
            .right(40)
            .bottom(40)
            .height(35)
            .width(35)
    }
    
    @objc func toMenuButtonPressed(){
        output.toMenuButtonPressed()
    }
    
    @objc func saveHabitButtonPressed(){
        output.saveHabitButtonPressed()
    }
    
}

extension HabitViewController: HabitViewInput {
}
