//
//  LogInProtocols.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 08.04.2021.
//  
//

import Foundation

protocol LogInModuleInput {
	var moduleOutput: LogInModuleOutput? { get }
}

protocol LogInModuleOutput: class {
}

protocol LogInViewInput: class {
}

protocol LogInViewOutput: class {
    func toSignUpButtonPressed()
    func logInButtonPressed(email: String?, password: String?)
}

protocol LogInInteractorInput: class {
    func logInUser(email: String?, password: String?)
}

protocol LogInInteractorOutput: class {
    func showAlert(message: String?)
    func toMenu()
}

protocol LogInRouterInput: class {
    func openMenu()
    func openSignUp()
    func showAlert(message: String?)
}
