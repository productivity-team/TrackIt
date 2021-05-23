//
//  HabitRouter.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 22.04.2021.
//  
//

import UIKit

final class HabitRouter {
    weak var sourceViewController: UIViewController?
}

extension HabitRouter: HabitRouterInput {
    
    func showAlert() {
        let alert = UIAlertController(title: "Ошибка", message: "Пожалуйста, впишите ваш прогресс", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        sourceViewController?.present(alert, animated: true, completion: nil)
    }
    
    
    //переход на главный экран
    func openMenu() {
        let container = TabBarContainer.assemble(with: TabBarContext())
        let viewController = container.viewController
        viewController.modalPresentationStyle = .fullScreen
        sourceViewController?.present(viewController, animated: true, completion: nil)
    }
   
    
    
}
