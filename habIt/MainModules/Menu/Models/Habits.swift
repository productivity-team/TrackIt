//
//  TestHabits.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 14.04.2021.
//
import UIKit
struct Habit {
    let title: String
    let systemImageName: String
    let target: String
    var numberOfCompletions: String?
    let units: String
    let identifier: String
    let creationDate: Int
    let untilDate: Int
    let habitDays: [Int]
    let habitIconColor: UIColor
    
    init(title: String, imageName: String, target: String, numberOfCompletions: String?, units: String, identifier: String, creationDate: Int, untilDate: Int, habitDays: [Int], color: UIColor) {
        self.title = title
        self.systemImageName = imageName
        self.target = target
        self.numberOfCompletions = numberOfCompletions
        self.units = units
        self.identifier = identifier
        self.creationDate = creationDate
        self.untilDate = untilDate
        self.habitDays = habitDays
        self.habitIconColor = color
    }
    
}
