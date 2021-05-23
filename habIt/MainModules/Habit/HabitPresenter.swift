//
//  HabitPresenter.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 22.04.2021.
//  
//

import Foundation

final class HabitPresenter {
	weak var view: HabitViewInput?
    weak var moduleOutput: HabitModuleOutput?

	private let router: HabitRouterInput
	private let interactor: HabitInteractorInput

    init(router: HabitRouterInput, interactor: HabitInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension HabitPresenter: HabitModuleInput {
}

extension HabitPresenter: HabitViewOutput {
    
    
    //алерт при обнаружении пустых полей
    func showAlert() {
        router.showAlert()
    }
    
    //сохранение выполнения привычки/дневника
    func saveHabitButtonPressed() {
    }
    
    //переход на главный экран
    func toMenuButtonPressed() {
        router.openMenu()
    }
    
    
}

extension HabitPresenter: HabitInteractorOutput {
}
