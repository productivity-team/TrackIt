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
    
    private let summLabel = UILabel()
    private let inRowLabel = UILabel()
    private let totalLabel = UILabel()
    private let doneLabel = UILabel()
    
    private let progressForCircle: Float = 0.75
    
    private let circularProgress = CircularProgress(frame: CGRect(x: 200, y: 44, width: 130, height: 130))
    
    private let color = UIColor(red: 0/255, green: 230/255, blue: 190/255, alpha: 1)


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
        
        inRowLabel.pin
            .top(235)
            .left(30)
            .height(22)
            .sizeToFit(.height)
        
        totalLabel.pin
            .top(235)
            .left(153)
            .height(22)
            .sizeToFit(.height)
        
        doneLabel.pin
            .top(111)
            .right(55)
            .height(18)
            .sizeToFit(.height)
        
        circularProgress.pin
            .top(50)
            .right(30)
            .sizeToFit()

    }
    
    private func setup() {
        titleLabel.font = UIFont(name: "Lato-Regular", size: 18)
        titleLabel.textColor = color
        unitsLabel.font = UIFont(name: "Lato-Regular", size: 16)
        unitsLabel.textColor = color
        targetLabel.font = UIFont(name: "Lato-Bold", size: 20)
        targetLabel.textColor = color
        iconImageView.tintColor = color
        
        summLabel.font = UIFont(name: "Lato-Regular", size: 18)
        summLabel.text = "Суммарно"
        summLabel.textColor = color
        inRowLabel.font = UIFont(name: "Lato-Regular", size: 18)
        inRowLabel.text = "Подряд"
        inRowLabel.textColor = color
        totalLabel.font = UIFont(name: "Lato-Regular", size: 18)
        totalLabel.text = "Всего выполнено"
        totalLabel.textColor = color
        doneLabel.font = UIFont(name: "Lato-Regular", size: 15)
        doneLabel.text = "Выполнено"
        
        circularProgress.progressColor = color
        circularProgress.trackColor =  UIColor(red: 238/255, green: 246/255, blue: 251/255, alpha: 1)
        circularProgress.tag = 101
//        circularProgress.center = self.view.center
        
        //animate progress
        self.perform(#selector(animateProgress), with: nil, afterDelay: 0.3)
        
        backgroundColor = UIColor.white
        
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowRadius = 1
        contentView.layer.shadowOffset = CGSize(width: 1, height: 1)
        contentView.layer.shadowOpacity = 0.8
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = UIColor.white
        
        selectionStyle = .none
        
        [titleLabel, iconImageView, targetLabel, unitsLabel, summLabel, inRowLabel, totalLabel, doneLabel, circularProgress].forEach {
            contentView.addSubview($0) }

    }
    
    @objc func animateProgress() {
        let cp = self.contentView.viewWithTag(101) as! CircularProgress
        cp.setProgressWithAnimation(duration: 1.0, value: progressForCircle)
    }
    

    func configure(with model: StatsViewModel) {
        titleLabel.text = model.title
        iconImageView.image = UIImage(named: model.systemImageName)
        targetLabel.text = "\(model.target)"
        unitsLabel.text = model.units
    }
}
