//
//  SignUpRouter.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 10.04.2021.
//  
//

import UIKit

final class SignUpRouter {
    weak var sourceViewController: UIViewController?
}

extension SignUpRouter: SignUpRouterInput {
    
    //переход на главный экран после регистрации
    
    
    //переход к экрану входа
    func openLogIn() {
        let container = LogInContainer.assemble(with: LogInContext())
        let viewController = container.viewController
        
        viewController.modalPresentationStyle = .fullScreen
        sourceViewController?.present(viewController, animated: true, completion: nil)
    }
    
    //функция с поп-апом:
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        sourceViewController?.present(alert, animated: true, completion: nil)
    }
    
}


