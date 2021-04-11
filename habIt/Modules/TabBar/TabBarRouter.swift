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
                MenuContainer.assemble().viewController,
                SettingsContainer.assemble().viewController]
            .map { UINavigationController(rootViewController: $0) }
        
        
    }
    
    func openTabBar() {
        //let container = MenuContainer.assemble()
        //sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }

    
    
}
