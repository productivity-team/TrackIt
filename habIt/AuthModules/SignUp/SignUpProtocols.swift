//
//  SignUpProtocols.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 10.04.2021.
//  
//

import Foundation

protocol SignUpModuleInput {
	var moduleOutput: SignUpModuleOutput? { get }
}

protocol SignUpModuleOutput: class {
}

protocol SignUpViewInput: class {
}

protocol SignUpViewOutput: class {
    func signUpButtonPressed(name: String?, email: String?, password: String?)
    func toLoginButtonPressed()
}

protocol SignUpInteractorInput: class {
    func SignUpUser(name: String?, email: String?, password: String?)
}

protocol SignUpInteractorOutput: class {
    func showAlert(message: String?)
    func toMenu()
}

protocol SignUpRouterInput: class {
    func openMenu()
    func openLogIn()
    func showAlert(message: String?)
}
