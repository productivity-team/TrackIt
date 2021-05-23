//
//  HabitProgress.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 21.05.2021.
//

struct HabitProgress {
    let title: String
    let habitColor: [Double]
    let target: String
    let units: String
    let identifier: String
    
    init(title: String, habitColor: [Double], target: String, units: String, identifier: String) {
        self.title = title
        self.habitColor = habitColor
        self.target = target
        self.units = units
        self.identifier = identifier
    }
    
}
