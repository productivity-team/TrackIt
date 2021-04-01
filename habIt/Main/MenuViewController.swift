//
//  MenuViewController.swift
//  habIt
//
//  Created by kjhfsjdgfhk on 02.04.2021.
//

import Foundation
import SwiftUI

class MenuViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 249/255, green: 255/255, blue: 255/255, alpha: 1)
        title = "Меню"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addHabit))
    }
    
    @objc
    private func addHabit() {
        return
    }
    
}
