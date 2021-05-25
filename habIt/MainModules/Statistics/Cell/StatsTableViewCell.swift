//
//  StatsTableViewCell.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 25.05.2021.
//

import UIKit

class StatsTableViewCell: UITableViewCell {
    private let titleLabel = UILabel()


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
            .bottom(8)
            .left(12)
            .height(40)
            .sizeToFit(.height)
        
    }
    
    private func setup() {
        titleLabel.font = UIFont(name: "Lato-Regular", size: 16)
        
        backgroundColor = UIColor.white
        
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowRadius = 1
        contentView.layer.shadowOffset = CGSize(width: 1, height: 1)
        contentView.layer.shadowOpacity = 0.8
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = UIColor.white
        
        selectionStyle = .none
        
        contentView.addSubview(titleLabel)

    }
    

    func configure(with model: StatsViewModel) {
        titleLabel.text = model.title
    }
}
