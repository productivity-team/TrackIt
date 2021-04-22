//
//  CreateHabitViewController.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 22.04.2021.
//  
//

import UIKit

final class CreateHabitViewController: UIViewController {
	private let output: CreateHabitViewOutput
    
    private let testLabel = UILabel()

    init(output: CreateHabitViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        
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

}

extension CreateHabitViewController: CreateHabitViewInput {
}
