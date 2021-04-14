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
    func logInButtonPressed()
}

protocol LogInInteractorInput: class {
    func logInUser()
}

protocol LogInInteractorOutput: class {
}

protocol LogInRouterInput: class {
    func openSignUp()
}
