//
//  WelcomePresenter.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 07.04.2021.
//  
//

import Foundation

final class WelcomePresenter {
	weak var view: WelcomeViewInput?
    weak var moduleOutput: WelcomeModuleOutput?

	private let router: WelcomeRouterInput
	private let interactor: WelcomeInteractorInput

    init(router: WelcomeRouterInput, interactor: WelcomeInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension WelcomePresenter: WelcomeModuleInput {
}

extension WelcomePresenter: WelcomeViewOutput {
    
    func toLogInButtonPressed() {
        router.openLogIn()
    }
    
    func toSignUpButtonPressed() {
        router.openSignUp()
    }
    
}

extension WelcomePresenter: WelcomeInteractorOutput {
}
