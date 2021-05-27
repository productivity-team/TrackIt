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
    
    init(title: String, imageName: String, target: String, units: String, habitProgress: [String:Int]) {
        self.title = title
        self.systemImageName = imageName
        self.target = target
        self.units = units
        self.habitProgress = habitProgress
    }
}
