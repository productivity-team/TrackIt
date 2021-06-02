//
//  CalendarCollectionViewCell.swift
//  habIt
//
//  Created by Костина Вероника  on 08.05.2021.
//

import UIKit

    class CalendarCollectionViewCell: UICollectionViewCell {
    var date = Date()
    var dayNumber = UILabel()
    var dayName = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(dayNumber)
        contentView.addSubview(dayName)
        dayNumber.font = UIFont(name: "Roboto-Bold", size: 15)
        dayName.font = UIFont(name: "Roboto-Regular", size: 10)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        dayNumber.pin
            .top(23)
            .left(9)
            .right(9)
            .sizeToFit(.width)
        dayName.pin.below(of: dayNumber)
            .marginVertical(5)
            .left(11)
            .right(11)
            .sizeToFit(.width)
    }
        
    func configure(with day:Int, weekday:String) {
        dayName.textAlignment = .center
        dayNumber.textAlignment = .center
        dayNumber.text = String(day)
        dayName.text = String(weekday)
    }
}
