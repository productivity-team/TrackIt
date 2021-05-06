//
//  WelcomeRouter.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 07.04.2021.
//  
//

import UIKit

final class WelcomeRouter {
    
    weak var sourceViewController: UIViewController?

}

extension WelcomeRouter: WelcomeRouterInput {
    
    //переход к экрану входа
    func openLogIn() {

        let container = LogInContainer.assemble(with: LogInContext())
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
}
