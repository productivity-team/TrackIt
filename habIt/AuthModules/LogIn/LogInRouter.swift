//
//  LogInRouter.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 08.04.2021.
//  
//

import UIKit

final class LogInRouter {
    weak var sourceViewController: UIViewController?
}

extension LogInRouter: LogInRouterInput {
    
    //переход на главный экран после входа
    func openMenu() {
        let container = TabBarContainer.assemble(with: TabBarContext())
        let viewController = container.viewController
        viewController.modalPresentationStyle = .fullScreen
        sourceViewController?.present(viewController, animated: true, completion: nil)
    }
    
    //переход к экрану регистрации
    func openSignUp() {
        let container = SignUpContainer.assemble(with: SignUpContext())
        let viewController = container.viewController
        viewController.modalPresentationStyle = .fullScreen
        sourceViewController?.present(viewController, animated: true, completion: nil)
    }
    
    //функция с поп-апом:
    func showAlert(message: String?) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        sourceViewController?.present(alert, animated: true, completion: nil)
    }
    
}
