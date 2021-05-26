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
    func getTitle() -> String
    func getUnits() -> String
    func getNumberOfCompletions() -> String
    func getTarget() -> String 
    func toMenuButtonPressed()
    func saveProgressButtonPressed(tappedHabitName: String, updateKey: String, numberOfCompletions: Int)
    func showAlert()
    func resetAlert() -> Bool
    func deleteHabitButtonPressed(habitName: String)
}

protocol HabitInteractorInput: class {
    func updateProgress(tappedHabitName: String, updateKey: String, numberOfCompletions: Int)
}

protocol HabitInteractorOutput: class {
    func openMenu()
}

protocol HabitRouterInput: class {
    func openMenu()
    func showAlert()
    func resetAlert() -> Bool
    func deleteHabitAlert()
}
