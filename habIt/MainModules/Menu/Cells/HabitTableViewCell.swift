//
//  HabitTableViewCell.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 13.04.2021.
//

import UIKit
import PinLayout

class HabitTableViewCell: UITableViewCell {
    private let titleLabel = UILabel()
    private let iconImageView = UIImageView()
    private let unitsLabel = UILabel()
    private let diaryImageView = UIImageView()
    private let completionsLabel = UILabel()
    private let targetLabel = UILabel()
    
    
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
                    .height(19)
                    .sizeToFit(.height)
                    .hCenter()
        
        iconImageView.pin
                    .size(50)
                    .left(20)
                    .vCenter()
                
        targetLabel.pin
                    .right(15)
                    .bottom(33)
                    .height(20)
                    .sizeToFit(.height)
        
        completionsLabel.pin
                    .before(of: targetLabel).margin(1)
                    .bottom(33)
                    .height(20)
                    .sizeToFit(.height)
        
        unitsLabel.pin
                    .right(15)
                    .bottom(15)
                    .height(18)
                    .sizeToFit(.height)
        
        diaryImageView.pin
                    .size(20)
                    .after(of: (targetLabel)).marginHorizontal(-22)
                    .above(of: (targetLabel)).marginVertical(11)

    }
    
    private func setup() {
        titleLabel.font = UIFont(name: "Lato-Regular", size: 16)
        unitsLabel.font = UIFont(name: "Lato-Regular", size: 15)
        targetLabel.font = UIFont(name: "Lato-Bold", size: 20)
        completionsLabel.font = UIFont(name: "Lato-Bold", size: 20)
        
        
        backgroundColor = UIColor.white
                
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowRadius = 1
        contentView.layer.shadowOffset = CGSize(width: 1, height: 1)
        contentView.layer.shadowOpacity = 0.8
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = UIColor.white
                
                selectionStyle = .none
        [titleLabel, iconImageView, completionsLabel, targetLabel, unitsLabel, diaryImageView].forEach {
            contentView.addSubview($0) }
    }
    
    func configure(with model: HabitViewModel) {
        titleLabel.text = model.title
        iconImageView.image = UIImage(named: model.systemImageName)
        completionsLabel.text = "\(model.numberOfCompletions) "
        targetLabel.text = "/ \(model.target)"
        unitsLabel.text = model.units
        diaryImageView.image = UIImage(named: "diary")
    }
}

