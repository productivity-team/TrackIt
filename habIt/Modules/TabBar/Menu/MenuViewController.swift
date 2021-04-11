//
//  MenuViewController.swift
//  test
//
//  Created by kjhfsjdgfhk on 09.04.2021.
//  
//

import UIKit

final class MenuViewController: UIViewController {
	private let output: MenuViewOutput
    private let tableView = UITableView()

    init(output: MenuViewOutput) {
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
        title = "Меню"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddButton))
        
        
        
        
	}
    @objc
    private func didTapAddButton() {
        output.didTapAddButton()
    }

}

extension MenuViewController: MenuViewInput {
}
