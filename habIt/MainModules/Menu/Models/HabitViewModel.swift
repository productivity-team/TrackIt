//
//  HabitViewModel.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 13.04.2021.
//

struct HabitViewModel {
    let title: String //название
    let systemImageName: String //иконка
    let target: String //цель
    var numberOfCompletions: String //кол-во выполненного
    let units: String //единицы измерения
    
    init(title: String, imageName: String, target: String, numberOfCompletions: String, units: String) {
        self.title = title
        self.systemImageName = imageName
        self.target = target
        self.numberOfCompletions = numberOfCompletions
        self.units = units
    }
    
}
