//
//  SettingsRouter.swift
//  tabbar
//
//  Created by kjhfsjdgfhk on 10.04.2021.
//  
//

import UIKit

final class SettingsRouter {
    weak var sourceViewController: UIViewController?
}

extension SettingsRouter: SettingsRouterInput {
    func logOut() {
        let container = WelcomeContainer.assemble(with: WelcomeContext())
        let viewController = container.viewController
        viewController.modalPresentationStyle = .fullScreen
        sourceViewController?.present(viewController, animated: true, completion: nil)
        
        UserDefaults.standard.set(false, forKey: "LoggedIn")
    }
    
}
