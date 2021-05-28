//
//  Stats.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 25.05.2021.
//
import UIKit
struct Stats {
    let title: String
    let identifier: String
    let systemImageName: String
    let target: String
    let units: String
    let habitProgress: [String:Int]
    let creationDate: Int
    let untilDate: Int
    let habitDays: [Int]
    let habitStatsColor: UIColor
    
    init(title: String, imageName: String, target: String, units: String, identifier: String, habitProgress: [String:Int], creationDate: Int, untilDate: Int, habitDays: [Int], color: UIColor) {
        self.title = title
        self.identifier = identifier
        self.systemImageName = imageName
        self.target = target
        self.units = units
        self.habitProgress = habitProgress
        self.creationDate = creationDate
        self.untilDate = untilDate
        self.habitDays = habitDays
        self.habitStatsColor = color
    }
}
