//
//  ColectionViewCell.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 07.05.2021.
//

import UIKit
import M13Checkbox

class IconPickerCell: UICollectionViewCell {

    var checkbox = M13Checkbox()
    
    var icons: IconData? {
        didSet {
            guard let icons = icons else { return }
            bg.image = icons.backgroundImage
            
        }
    }
    
    fileprivate let bg: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(bg)

        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        // Setup of checkbox
        checkbox.isUserInteractionEnabled = false
        checkbox.tintColor = UIColor(red: 14/255, green: 67/255, blue: 205/255, alpha: 1)
        checkbox.checkmarkLineWidth = 5
        checkbox.hideBox = true
        checkbox.setCheckState(.unchecked, animated: false)
        checkbox.boxType = .square
        
        self.addSubview(checkbox)
        
        checkbox.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraint(NSLayoutConstraint(item: checkbox, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: checkbox, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: checkbox, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: checkbox, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

