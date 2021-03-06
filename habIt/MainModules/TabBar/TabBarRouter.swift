//
//  TabBarRouter.swift
//  test
//
//  Created by kjhfsjdgfhk on 09.04.2021.
//  
//

import UIKit

final class TabBarRouter {
    weak var sourceViewController: UIViewController?
}

extension TabBarRouter: TabBarRouterInput {
    func displayTabBar() -> [UIViewController] {
        //let menu = MenuContainer.assemble()
        
        
        
        return [StatsContainer.assemble().viewController,
                MenuContainer.assemble(with: MenuContext()).viewController,
                SettingsContainer.assemble(with: SettingsContext()).viewController]
            .map { UINavigationController(rootViewController: $0) }
        
        
    } 
}
