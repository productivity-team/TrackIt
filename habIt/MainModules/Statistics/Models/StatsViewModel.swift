//
//  StatsViewModel.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 25.05.2021.
//

struct StatsViewModel {
    let title: String
    let systemImageName: String
    let target: String
    let units: String
    let habitProgress: [String:Int]
    let creationDate: Int
    let untilDate: Int
    let habitDays: [Int]
    
    init(title: String, imageName: String, target: String, units: String, habitProgress: [String:Int], creationDate: Int, untilDate: Int, habitDays: [Int]) {
        self.title = title
        self.systemImageName = imageName
        self.target = target
        self.units = units
        self.habitProgress = habitProgress
        self.creationDate = creationDate
        self.untilDate = untilDate
        self.habitDays = habitDays
    }
}
