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

    //переход на экран входа
    func toLoginButtonPressed() {
        router.openLogIn()
    }
    
    //регистрация аккаунта
    func signUpButtonPressed(name:String?, email: String?, password: String?) {
        interactor.SignUpUser(name: name, email: email, password: password)
    }
    
}

extension SignUpPresenter: SignUpInteractorOutput {
    
    func showAlert(message: String?) {
        router.showAlert(message: message)
    }
    
    func toMenu() {
        router.openMenu()
    }
    
}
