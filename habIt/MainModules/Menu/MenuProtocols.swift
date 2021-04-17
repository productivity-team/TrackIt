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
//    var habitsViewModels: [HabitViewModel] { get }
    func didTapAddButton()
    func countHabits() -> Int
    func getCellByIndentifier(id: Int) -> HabitViewModel
}

protocol MenuInteractorInput: class {
    func getHabits() -> [HabitViewModel]
}

protocol MenuInteractorOutput: class {
    
}

protocol MenuRouterInput: class {
    func openAddScreen()
}
