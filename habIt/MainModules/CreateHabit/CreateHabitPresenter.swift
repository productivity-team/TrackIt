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
    
    func createHabitButtonPressed(creationDate: Int, untilDate: Int, title: String, imageName: String, habitColor: [Double], target: String, units: String, habitDays: [Int], habitProgress: [String: Int]) {
        interactor.saveHabit(creationDate: creationDate, untilDate: untilDate, title: title, imageName: imageName, habitColor: habitColor, target: target, units: units, habitDays: habitDays, habitProgress: habitProgress)
    }
    
    func showAlert() {
        router.showAlert()
    }
    
    func iconchangeButtonPressed() {
        router.toIconPicker()
    }
    
    func colorchangeButtonPressed() {
        router.toColorPicker()
    }
    
}

extension CreateHabitPresenter: CreateHabitInteractorOutput {
    func closeHabitCreation() {
        router.closeHabitCreation()
    }
    
}
