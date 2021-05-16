//
//  TestHabits.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 14.04.2021.
//

struct Habit {
    let title: String
    let systemImageName: String
    let target: String
    var numberOfCompletions: String?
    let units: String
    let identifier: String
    
    init(title: String, imageName: String, target: String, numberOfCompletions: String?, units: String, identifier: String) {
        self.title = title
        self.systemImageName = imageName
        self.target = target
        self.numberOfCompletions = numberOfCompletions
        self.units = units
        self.identifier = identifier
    }
    
}
