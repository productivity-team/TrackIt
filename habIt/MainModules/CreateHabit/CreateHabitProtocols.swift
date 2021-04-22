//
//  CreateHabitProtocols.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 22.04.2021.
//  
//

import Foundation

protocol CreateHabitModuleInput {
	var moduleOutput: CreateHabitModuleOutput? { get }
}

protocol CreateHabitModuleOutput: class {
}

protocol CreateHabitViewInput: class {
}

protocol CreateHabitViewOutput: class {
}

protocol CreateHabitInteractorInput: class {
}

protocol CreateHabitInteractorOutput: class {
}

protocol CreateHabitRouterInput: class {
}
