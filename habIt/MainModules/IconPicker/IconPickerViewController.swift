//
//  IconPickerViewController.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 05.05.2021.
//  
//

import UIKit
import EzPopup

final class IconPickerViewController: UIViewController {
	private let output: IconPickerViewOutput
    
    private let saveButton = UIButton()

    init(output: IconPickerViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 249/255, green: 255/255, blue: 255/255, alpha: 1)
        
        saveButton.setTitle("Выбрать", for: .normal)
        saveButton.titleLabel?.font = UIFont(name: "Lato-Medium", size: 20)
        saveButton.backgroundColor = UIColor(red: 182/255, green: 230/255, blue: 255/255, alpha: 1)
        saveButton.layer.cornerRadius = 10
        saveButton.setTitleColor(UIColor(red: 48/255, green: 48/255, blue: 48/255, alpha: 1), for: .normal)
        saveButton.addTarget(self, action: #selector(selectedIconButtonPressed), for: .touchUpInside)
        
        view.addSubview(saveButton)
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        saveButton.pin
            .height(50)
            .width(160)
            .bottom(40)
            .hCenter()
    }
    
    @objc
    private func selectedIconButtonPressed() {
        output.selectedIconButtonPressed()
    }
    
}

extension IconPickerViewController: IconPickerViewInput {
}
