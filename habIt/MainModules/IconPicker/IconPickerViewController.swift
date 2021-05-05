//
//  IconPickerViewController.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 05.05.2021.
//  
//

import UIKit

final class IconPickerViewController: UIViewController {
	private let output: IconPickerViewOutput

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
	}
}

extension IconPickerViewController: IconPickerViewInput {
}
