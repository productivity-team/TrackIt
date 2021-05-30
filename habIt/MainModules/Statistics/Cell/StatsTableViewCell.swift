//
//  StatsTableViewCell.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 25.05.2021.
//

import UIKit

class StatsTableViewCell: UITableViewCell {
    private let titleLabel = UILabel()
    private let iconImageView = UIImageView()
    private let targetLabel = UILabel()
    private let unitsLabel = UILabel()
    
    private let summLabel = UILabel() //Суммарно
    private let partlyDoneLabel = UILabel() //Частично
    private let fullyDoneLabel = UILabel() //Полностью
    private let doneLabel = UILabel() //Выполнено (внутри круга)
    private let progressLabel = UILabel() // прогресс (внутри круга)
    
    private let completedInUnits = UILabel() //Суммарно число
    private let completedInUnitsLabel = UILabel() //Суммарно юниты
    private let partlyDone = UILabel() //Частично число
    private let fullyDone = UILabel() //Полностью число
    private let partlyTimes = UILabel()
    private let fullyTimes = UILabel()
    
    private var progressForCircle: Float = 0.75
    
    private let circularProgress = CircularProgress(frame: CGRect(x: 200, y: 44, width: 130, height: 130))

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.pin
            .horizontally(12)
            .vertically(18)
        
        titleLabel.pin
            .top(10)
            .height(22)
            .sizeToFit(.height)
            .hCenter()
        
        iconImageView.pin
            .size(50)
            .top(44)
            .left(30)
        
        targetLabel.pin
            .top(70)
            .left(94)
            .height(24)
            .sizeToFit(.height)
        
        unitsLabel.pin
            .top(99)
            .left(30)
            .height(19)
            .sizeToFit(.height)
        
        summLabel.pin
            .top(167)
            .left(30)
            .height(22)
            .sizeToFit(.height)
        
        partlyDoneLabel.pin
            .top(235)
            .left(30)
            .height(22)
            .sizeToFit(.height)
        
        fullyDoneLabel.pin
            .top(235)
            .left(153)
            .height(22)
            .sizeToFit(.height)
        
        doneLabel.pin
            .top(120)
            .right(55)
            .height(18)
            .sizeToFit(.height)
        
        progressLabel.pin
            .above(of: doneLabel, aligned: .center).margin(6)
            .height(20)
            .sizeToFit(.height)
 
        circularProgress.pin
            .top(50)
            .right(30)
            .sizeToFit()
        
        completedInUnits.pin
            .top(194)
            .left(30)
            .height(22)
            .sizeToFit(.height)
        
        completedInUnitsLabel.pin
            .top(197)
            .after(of: completedInUnits)
            .height(18)
            .sizeToFit(.height)
        
        partlyDone.pin
            .top(265)
            .left(30)
            .height(22)
            .sizeToFit(.height)
        
        partlyTimes.pin
            .top(268)
            .after(of: partlyDone)
            .height(18)
            .sizeToFit(.height)
        
        fullyDone.pin
            .top(265)
            .left(153)
            .height(22)
            .sizeToFit(.height)
        
        fullyTimes.pin
            .top(268)
            .after(of: fullyDone)
            .height(18)
            .sizeToFit(.height)
    }
    
    private func setup() {
        titleLabel.font = UIFont(name: "Lato-Regular", size: 18)
        unitsLabel.font = UIFont(name: "Lato-Regular", size: 16)
        targetLabel.font = UIFont(name: "Lato-Bold", size: 20)
        
        summLabel.font = UIFont(name: "Lato-Regular", size: 18)
        summLabel.text = "Суммарно"
        
        partlyDoneLabel.font = UIFont(name: "Lato-Regular", size: 18)
        partlyDoneLabel.text = "Частично"
        partlyDone.font = UIFont(name: "Lato-Regular", size: 18)
        partlyTimes.text = " Раз"
        partlyTimes.font = UIFont(name: "Lato-Regular", size: 15)
        
        fullyDoneLabel.font = UIFont(name: "Lato-Regular", size: 18)
        fullyDoneLabel.text = "Полностью"
        fullyDone.font = UIFont(name: "Lato-Regular", size: 18)
        fullyTimes.text = " Раз"
        fullyTimes.font = UIFont(name: "Lato-Regular", size: 15)
        
        doneLabel.font = UIFont(name: "Lato-Regular", size: 15)
        doneLabel.text = "Выполнено"
        
        progressLabel.font = UIFont(name: "Lato-Bold", size: 20)
        
        circularProgress.trackColor =  UIColor(red: 238/255, green: 246/255, blue: 251/255, alpha: 1)
        circularProgress.tag = 101
        
        
        
        completedInUnits.font = UIFont(name: "Lato-Regular", size: 18)
        completedInUnitsLabel.font = UIFont(name: "Lato-Regular", size: 15)
        
        backgroundColor = UIColor.white
        
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowRadius = 1
        contentView.layer.shadowOffset = CGSize(width: 1, height: 1)
        contentView.layer.shadowOpacity = 0.8
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = UIColor.white
        
        selectionStyle = .none
        
        [titleLabel, iconImageView, targetLabel, unitsLabel, summLabel, partlyDoneLabel, fullyDoneLabel, doneLabel, circularProgress, completedInUnits, completedInUnitsLabel, partlyDone, fullyDone, partlyTimes, fullyTimes, progressLabel].forEach {
            contentView.addSubview($0) }

    }
    

    func configure(with model: StatsViewModel,totalNumberOfDays: Int) {
        titleLabel.text = model.title
        iconImageView.image = UIImage(named: model.systemImageName)
        targetLabel.text = "\(model.target)"
        unitsLabel.text = model.units
        completedInUnits.text = String((model.habitProgress.values.reduce(0, +)))
        completedInUnitsLabel.font = UIFont(name: "Lato-Regular", size: 15)
        completedInUnitsLabel.text = " \(unitsLabel.text!)"
        let partly = model.habitProgress.values.filter {$0 > 0 && $0 < Int(model.target)!}
        partlyDone.text = String(partly.count)
        let fully = model.habitProgress.values.filter {$0 >= Int(model.target)!}
        fullyDone.text = String(fully.count)
        if model.untilDate == 20000 {
            progressLabel.font = UIFont(name: "Lato-Bold", size: 20)
            progressLabel.text = "\(fully.count)/∞"
            progressForCircle = 1
        } else {
        progressLabel.text = "\(fully.count)/\(totalNumberOfDays)"
            progressForCircle = Float(fully.count) / Float(totalNumberOfDays)
        }
        UIView.animate(withDuration: 0) {
            let cp = self.contentView.viewWithTag(101) as! CircularProgress
            cp.setProgressWithAnimation(duration: 0, value: self.progressForCircle)

        }
        let customColor = model.habitStatsColor
        targetLabel.textColor = customColor
        iconImageView.tintColor = customColor
        summLabel.textColor = customColor
        partlyDoneLabel.textColor = customColor
        fullyDoneLabel.textColor = customColor
        circularProgress.progressColor = customColor
        progressLabel.textColor = customColor
    }
}
