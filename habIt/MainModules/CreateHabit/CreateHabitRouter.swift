//
//  CreateHabitRouter.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 22.04.2021.
//  
//

import UIKit

final class CreateHabitRouter {
    weak var sourceViewController: UIViewController?
}

extension CreateHabitRouter: CreateHabitRouterInput {
    
    func toColorPicker() {
        let container = ColorPickerContainer.assemble(with: ColorPickerContext())
        let viewController = container.viewController
        
        let navigationController = UINavigationController(rootViewController: viewController)
        viewController.modalPresentationStyle = .fullScreen
        sourceViewController?.present(navigationController, animated: true, completion: nil)
        navigationController.navigationBar.isHidden = true
    }
    
}
