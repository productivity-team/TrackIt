//
//  LogInPresenter.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 08.04.2021.
//  
//

import Foundation

final class LogInPresenter {
	weak var view: LogInViewInput?
    weak var moduleOutput: LogInModuleOutput?

	private let router: LogInRouterInput
	private let interactor: LogInInteractorInput

    init(router: LogInRouterInput, interactor: LogInInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension LogInPresenter: LogInModuleInput {
}

extension LogInPresenter: LogInViewOutput {
    
    func toSignUpButtonPressed() {
        router.openSignUp()
    }
    
    func logInButtonPressed() {
        interactor.logInUser()
    }
    
}

extension LogInPresenter: LogInInteractorOutput {
    
}
