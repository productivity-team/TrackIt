//
//  HabitTableViewCell.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 13.04.2021.
//

import UIKit

class HabitTableViewCell: UITableViewCell {
    private let titleLabel = UILabel()
    private let iconImageView = UIImageView()
    private let progressLabel = UILabel()
    private let unitsLabel = UILabel()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {

        titleLabel.font = UIFont(name: "Lato-Regular", size: 20)
        unitsLabel.textColor = .darkGray
        progressLabel.font = UIFont(name: "Lato-Medium", size: 18)
        backgroundColor = UIColor.white
        
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowRadius = 0.5
        contentView.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        contentView.layer.shadowOpacity = 0.8
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = UIColor.white
        
        selectionStyle = .none
        
        [titleLabel, iconImageView, progressLabel, unitsLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.pin
            .horizontally(12)
            .vertically(18)
        
        titleLabel.pin
            .left(76)
            .height(30)
            .sizeToFit(.height)
            .vCenter()
        
        iconImageView.pin
            .size(30)
            .left(20)
            .vCenter()
        
        progressLabel.pin
            .right(38)
            .top(20)
            .height(20)
            .sizeToFit(.height)
            .vCenter()
        
        unitsLabel.pin
            .below(of: progressLabel)
            .right(38)
            .height(20)
            .sizeToFit(.height)
        
    }

    func configure(with model: HabitViewModel) {
        titleLabel.text = model.title
        iconImageView.image = UIImage(systemName: model.systemImageName)
        progressLabel.text = model.progress
        unitsLabel.text = model.units
    }
}

