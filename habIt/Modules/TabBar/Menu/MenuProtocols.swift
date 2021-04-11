//
//  MenuProtocols.swift
//  test
//
//  Created by kjhfsjdgfhk on 09.04.2021.
//  
//

import Foundation

protocol MenuModuleInput {
	var moduleOutput: MenuModuleOutput? { get }
}

protocol MenuModuleOutput: class {
}

protocol MenuViewInput: class {
}

protocol MenuViewOutput: class {
    func didTapAddButton()
}

protocol MenuInteractorInput: class {
}

protocol MenuInteractorOutput: class {
}

protocol MenuRouterInput: class {
    func openAddScreen()
}
