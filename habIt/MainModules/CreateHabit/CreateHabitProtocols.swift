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
    func colorchangeButtonPressed()
    func iconchangeButtonPressed()
    func showAlert()
    func createHabitButtonPressed(creationDate: Int, untilDate: Int, title: String, imageName: String, habitColor: [Double], target: String, units: String, habitDays: [Int], habitProgress: [String: Int])
}

protocol CreateHabitInteractorInput: class {
    func saveHabit(creationDate: Int, untilDate: Int, title: String, imageName: String, habitColor: [Double], target: String, units: String, habitDays: [Int], habitProgress: [String: Int])
}

protocol CreateHabitInteractorOutput: class {
    func closeHabitCreation()
}

protocol CreateHabitRouterInput: class {
    func toColorPicker()
    func toIconPicker()
    func showAlert()
    func closeHabitCreation()
}
