//
//  HabitProtocols.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 22.04.2021.
//  
//

import Foundation

protocol HabitModuleInput {
	var moduleOutput: HabitModuleOutput? { get }
}

protocol HabitModuleOutput: class {
}

protocol HabitViewInput: class {
}

protocol HabitViewOutput: class {
    func toMenuButtonPressed()
    func saveHabitButtonPressed()
}

protocol HabitInteractorInput: class {
}

protocol HabitInteractorOutput: class {
}

protocol HabitRouterInput: class {
    func openMenu()
}
