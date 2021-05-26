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
    let creationDate: Int //дата начала привычки (в днях от 01.01.2001)
    let untilDate: Int //дата окончания привычки (в днях от 01.01.2001)
    let habitDays: [Int] // массив с днями недели (1-вс, 2-пн и т.д)
    
    
    init(title: String, imageName: String, target: String, numberOfCompletions: String, units: String, creationDate: Int, untilDate: Int, habitDays: [Int]) {
        self.title = title
        self.systemImageName = imageName
        self.target = target
        self.numberOfCompletions = numberOfCompletions
        self.units = units
        self.creationDate = creationDate
        self.untilDate = untilDate
        self.habitDays = habitDays
    }
    
}
