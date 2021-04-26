//
//  MenuRouter.swift
//  test
//
//  Created by kjhfsjdgfhk on 09.04.2021.
//  
//

import UIKit

final class MenuRouter {
    weak var sourceViewController: UIViewController?
}

extension MenuRouter: MenuRouterInput {
    
    //открыть экран привычки
    func showHabit(model: HabitViewModel) {
        
        let container = HabitContainer.assemble(with: HabitContext())
        let viewController = container.viewController
        
        viewController.title = model.title
        viewController.view.backgroundColor = .systemBackground
        
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .fullScreen
        sourceViewController?.present(navigationController, animated: true, completion: nil)
//        navigationController.navigationBar.isHidden = true
    }
    
    //открыть экран создания привычки
    func openAddScreen() {
        let container = CreateHabitContainer.assemble(with: CreateHabitContext())
        let viewController = container.viewController
        
        let navigationController = UINavigationController(rootViewController: viewController)
        sourceViewController?.present(navigationController, animated: true, completion: nil)
        navigationController.navigationBar.isHidden = true
    }
}
