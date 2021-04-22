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
    
    private let testLabel = UILabel()
    

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
        
        let backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(toMenuButtonPressed))
        self.navigationItem.leftBarButtonItem  = backBarButtonItem
        
        let saveBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(saveHabitButtonPressed))
        self.navigationItem.rightBarButtonItem  = saveBarButtonItem
        
        
        testLabel.text = "test label"
        testLabel.font = .systemFont(ofSize: 30)
        testLabel.font = UIFont(name: "Lato-Regular", size: 30)
        
        view.addSubview(testLabel)
	}
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
        testLabel.pin
            .hCenter()
            .bottom(541)
            .sizeToFit()
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
