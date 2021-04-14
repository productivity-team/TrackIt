//
//  SignUpPresenter.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 10.04.2021.
//  
//

import Foundation

final class SignUpPresenter {
	weak var view: SignUpViewInput?
    weak var moduleOutput: SignUpModuleOutput?

	private let router: SignUpRouterInput
	private let interactor: SignUpInteractorInput

    init(router: SignUpRouterInput, interactor: SignUpInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension SignUpPresenter: SignUpModuleInput {
}

extension SignUpPresenter: SignUpViewOutput {

    func signUpButtonPressed() {
        interactor.SignUpUser()
    }
    
    func toLoginButtonPressed() {
        router.openLogIn()
    }
    
}

extension SignUpPresenter: SignUpInteractorOutput {
}
