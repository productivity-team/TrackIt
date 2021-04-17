//
//  HabitViewModel.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 13.04.2021.
//












struct HabitViewModel {
    let title: String
    let systemImageName: String
    let target: Int
    let numberOfCompletions: Int?
    var progress: String {
        return "\(numberOfCompletions ?? 0)/\(target)" }
    let units: String
    
    init(title: String, imageName: String, target: Int, numberOfCompletions: Int?, units: String) {
        self.title = title
        self.systemImageName = imageName
        self.target = target
        self.numberOfCompletions = numberOfCompletions
        self.units = units
    }
    
}
