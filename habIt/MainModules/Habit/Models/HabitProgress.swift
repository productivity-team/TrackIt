//
//  HabitProgress.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 21.05.2021.
//

struct HabitProgress {
    var title: String
    var habitColor: [Double]
    var target: String
    var units: String
    var numberOfCompletions: String
    let identifier: String
    
    init(title: String, habitColor: [Double], target: String, units: String, identifier: String, numberOfCompletions: String) {
        self.title = title
        self.habitColor = habitColor
        self.target = target
        self.units = units
        self.numberOfCompletions = numberOfCompletions
        self.identifier = identifier
    }
    
}
