//
//  TestHabits.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 14.04.2021.
//

//struct TestHabits {
//    let habits = [
//        HabitViewModel(title: "Бег", imageName: "figure.walk", target: 5, numberOfCompletions: 1, units: "км"),
//        HabitViewModel(title: "Вода", imageName: "drop", target: 3, numberOfCompletions: nil, units: "стакан")
//    ]
//}

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
