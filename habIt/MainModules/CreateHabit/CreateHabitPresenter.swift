//
//  CreateHabitPresenter.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 22.04.2021.
//  
//

import Foundation

final class CreateHabitPresenter {
	weak var view: CreateHabitViewInput?
    weak var moduleOutput: CreateHabitModuleOutput?

	private let router: CreateHabitRouterInput
	private let interactor: CreateHabitInteractorInput

    init(router: CreateHabitRouterInput, interactor: CreateHabitInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension CreateHabitPresenter: CreateHabitModuleInput {
}

extension CreateHabitPresenter: CreateHabitViewOutput {
}

extension CreateHabitPresenter: CreateHabitInteractorOutput {
}
