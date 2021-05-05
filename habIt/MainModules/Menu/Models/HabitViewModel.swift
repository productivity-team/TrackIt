//
//  HabitViewModel.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 13.04.2021.
//

struct HabitViewModel {
    let title: String //название
    let systemImageName: String //иконка
    let target: Int //цель (не выводится)
    var numberOfCompletions: Int //кол-во выполненного (не выводится)
    var progress: String {
        return "\(numberOfCompletions)/\(target)" } //прогресс (выводится на основе target и numberOfCompletions)
    let units: String //единицы измерения
    
    init(title: String, imageName: String, target: Int, numberOfCompletions: Int, units: String) {
        self.title = title
        self.systemImageName = imageName
        self.target = target
        self.numberOfCompletions = numberOfCompletions
        self.units = units
    }
    
}
