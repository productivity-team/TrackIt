//
//  WelcomeProtocols.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 07.04.2021.
//  
//

import Foundation

protocol WelcomeModuleInput {
	var moduleOutput: WelcomeModuleOutput? { get }
}

protocol WelcomeModuleOutput: class {
}

protocol WelcomeViewInput: class {
}

protocol WelcomeViewOutput: class {
    func toLogInButtonPressed()
    func toSignUpButtonPressed()
}

protocol WelcomeInteractorInput: class {
}

protocol WelcomeInteractorOutput: class {
}

protocol WelcomeRouterInput: class {
    func openLogIn()
    func openSignUp()
}
