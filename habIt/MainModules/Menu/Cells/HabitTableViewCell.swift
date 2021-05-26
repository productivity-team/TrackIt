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
    private let completionsLabel = UILabel()
    private let targetLabel = UILabel()
    private let progressBar = UIProgressView()
    
    private var progressPercent: Float = 0
    
    
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
        
        completionsLabel.pin
                    .left(85)
                    .bottom(37)
                    .height(20)
                    .sizeToFit(.height)
        
        targetLabel.pin
                    .after(of: completionsLabel)
                    .bottom(37)
                    .height(20)
                    .sizeToFit(.height)
        
        unitsLabel.pin
                    .right(20)
                    .bottom(38)
                    .height(18)
                    .sizeToFit(.height)
        
        progressBar.pin
                    .left(85)
                    .right(20)
                    .top(63)
                    .height(4)
                    .sizeToFit(.width)
    }
    
    private func setup() {
        titleLabel.font = UIFont(name: "Lato-Regular", size: 16)
        unitsLabel.font = UIFont(name: "Lato-Regular", size: 15)
        targetLabel.font = UIFont(name: "Lato-Bold", size: 20)
        completionsLabel.font = UIFont(name: "Lato-Bold", size: 20)
        progressBar.trackTintColor = UIColor(red: 238/255, green: 246/255, blue: 251/255, alpha: 1)
        
        
        backgroundColor = UIColor.white
                
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowRadius = 1
        contentView.layer.shadowOffset = CGSize(width: 1, height: 1)
        contentView.layer.shadowOpacity = 0.3
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = UIColor.white
                
                selectionStyle = .none
        [titleLabel, iconImageView, completionsLabel, targetLabel, unitsLabel, progressBar].forEach {
            contentView.addSubview($0) }
    }
    
    func configure(with model: HabitViewModel) {
        titleLabel.text = model.title
        iconImageView.image = UIImage(named: model.systemImageName)
        completionsLabel.text = "\(model.numberOfCompletions) "
        targetLabel.text = "/ \(model.target)"
        unitsLabel.text = model.units
        progressPercent = Float(model.numberOfCompletions)!/Float(model.target)!
        UIView.animate(withDuration: 0.4) {
            self.progressBar.setProgress(self.progressPercent, animated: true)
        }

    }
}

