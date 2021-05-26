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
    var habitProgress = HabitProgress(title: "", habitColor: [], target: "", units: "", identifier: "", numberOfCompletions: "")

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

    
    
    func getTitle () -> String {
        habitProgress.title
    }
    
    func getNumberOfCompletions() -> String {
        habitProgress.numberOfCompletions
    }
    
    func getTarget() -> String {
        habitProgress.target
    }
    
    func getUnits() -> String {
        habitProgress.units
    }

    //алерт при обнаружении пустых полей
    func showAlert() {
        router.showAlert()
    }
    
    //алерт перед сбросом прогресса привычки
    func resetAlert() -> Bool {
        router.resetAlert()
    }
    
    //сохранение выполнения привычки
    func saveProgressButtonPressed(tappedHabitName: String, updateKey: String, numberOfCompletions: Int) {
        interactor.updateProgress(tappedHabitName: tappedHabitName, updateKey: updateKey, numberOfCompletions: numberOfCompletions)
    }
    
    //удаление привычки
    func deleteHabitButtonPressed(habitName: String) {
        router.deleteHabitAlert()
    }
    
    //переход на главный экран
    func toMenuButtonPressed() {
        router.openMenu()
    }
    
    
}

extension HabitPresenter: HabitInteractorOutput {
    
    func openMenu() {
        router.openMenu()
    }
    
}
