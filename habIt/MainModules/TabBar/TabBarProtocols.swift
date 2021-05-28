//
//  TabBarProtocols.swift
//  test
//
//  Created by kjhfsjdgfhk on 09.04.2021.
//  
//

import Foundation
import UIKit

protocol TabBarModuleInput {
	var moduleOutput: TabBarModuleOutput? { get }
}

protocol TabBarModuleOutput: class {
}

protocol TabBarViewInput: class {
    func showTabBar(items: [UIViewController])
    func loadTabBarItems(Items: [itemInfo])
}

protocol TabBarViewOutput: class {
    func didLoadView()
}

protocol TabBarInteractorInput: class {
    func load()
}

protocol TabBarInteractorOutput: class {
    func didLoad(Items: [itemInfo])
}

protocol TabBarRouterInput: class {
    func displayTabBar() -> [UIViewController]
}
