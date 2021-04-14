//
//  WelcomeRouter.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 07.04.2021.
//  
//

import UIKit

final class WelcomeRouter {
    
    weak var sourceViewController: UIViewController!

}

extension WelcomeRouter: WelcomeRouterInput {
    
    //переход к экрану входа
    func openLogIn() {

        let container = LogInContainer.assemble(with: LogInContext())
        sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)

    }

    //переход к экрану регистрации
    func openSignUp() {

        let container = SignUpContainer.assemble(with: SignUpContext())
        sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)

    }
    
    
}
