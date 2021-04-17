//
//  MenuPresenter.swift
//  test
//
//  Created by kjhfsjdgfhk on 09.04.2021.
//  
//

import Foundation

final class MenuPresenter {
	weak var view: MenuViewInput?
    weak var moduleOutput: MenuModuleOutput?

	private let router: MenuRouterInput
	private let interactor: MenuInteractorInput
    
    var habits: [HabitViewModel] = []
    

    init(router: MenuRouterInput, interactor: MenuInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
    
    
}

extension MenuPresenter: MenuModuleInput {
}

extension MenuPresenter: MenuViewOutput {
    func getCellByIndentifier(id: Int) -> HabitViewModel {
        habits = interactor.getHabits()
        return habits[id]
    }
    
    func countHabits() -> Int {
        habits = interactor.getHabits()
        return habits.count
    }
    
    
    func didTapAddButton() {
        self.router.openAddScreen()
    }
    
}

extension MenuPresenter: MenuInteractorOutput {
}

