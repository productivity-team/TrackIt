//
//  StatsViewController.swift
//  tabbar
//
//  Created by kjhfsjdgfhk on 10.04.2021.
//  
//

import UIKit

final class StatsViewController: UIViewController {
	private let output: StatsViewOutput

    init(output: StatsViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        view.backgroundColor = UIColor(red: 238/255, green: 246/255, blue: 251/255, alpha: 1)
        title = "Статистика"
	}
}

extension StatsViewController: StatsViewInput {
}
