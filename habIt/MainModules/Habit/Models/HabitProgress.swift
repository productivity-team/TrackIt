//
//  HabitProgress.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 21.05.2021.
//
import UIKit
struct HabitProgress {
    var title: String
    var habitColor: UIColor
    var target: String
    var units: String
    var numberOfCompletions: String
    let identifier: String
    
    init(title: String, habitColor: UIColor, target: String, units: String, identifier: String, numberOfCompletions: String) {
        self.title = title
        self.habitColor = habitColor
        self.target = target
        self.units = units
        self.numberOfCompletions = numberOfCompletions
        self.identifier = identifier
    }
    
}
