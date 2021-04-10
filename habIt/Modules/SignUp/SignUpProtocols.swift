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
    func signUpButtonPressed()
    func toLoginButtonPressed()
}

protocol SignUpInteractorInput: class {
    func SignUpUser()
}

protocol SignUpInteractorOutput: class {
}

protocol SignUpRouterInput: class {
    func openLogIn()
}
