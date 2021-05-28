//
//  HabitManager.swift
//  habIt
//
//  Created by Fred Fred on 02.05.2021.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

enum NetworkError: Error {
    case unexpected
}

protocol HabitManagerDescriprion {

    func observeHabits(completion: @escaping (Result<[Habit], Error>) -> Void)
}

final class HabitsManager: HabitManagerDescriprion {
    private let database = Firestore.firestore()
    static let shared: HabitManagerDescriprion = HabitsManager()
    let user = Auth.auth().currentUser
    private init() {}
    func observeHabits(completion: @escaping (Result<[Habit], Error>) -> Void) {
        if let user = self.user {
            let uid = user.uid
            database.collection("users").document(uid).collection("habits").order(by: "creationDate", descending: true).addSnapshotListener { (querySnapshot, error) in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let documents = querySnapshot?.documents else {
                    completion(.failure(NetworkError.unexpected))
                    return
                }
                
                let habits = documents.compactMap { HabitConverter.habit(from: $0) }
                completion(.success(habits))
            }
        }
    }
}

final class HabitConverter {
    enum Key: String {
        case title
        case imageName
        case target
        case habitProgress
        case units
        case creationDate
        case untilDate
        case habitDays
        case habitColor
    }
    
    static func habit(from document: DocumentSnapshot) -> Habit? {
        guard let dict = document.data(),
              let title = dict[Key.title.rawValue] as? String,
              let systemImageName = dict[Key.imageName.rawValue] as? String,
              let target = dict[Key.target.rawValue] as? String,
              let habitProgress = dict[Key.habitProgress.rawValue] as? [String: Any],
              let units = dict[Key.units.rawValue] as? String,
              let creationDate = dict[Key.creationDate.rawValue] as? Int,
              let untilDate = dict[Key.untilDate.rawValue] as? Int,
              let habitDays = dict[Key.habitDays.rawValue] as? [Int],
              let habitColor = dict[Key.habitColor.rawValue] as? [Double]
        else {
            return nil
        }
        let numberOfCompletions = "\(habitProgress["\(diffInDays)"] as? Int ?? 0)"
        let red = CGFloat(habitColor[0])
        let green = CGFloat(habitColor[1])
        let blue = CGFloat(habitColor[2])
        let alpha = CGFloat(habitColor[3])
        let habitIconColor = UIColor(displayP3Red: red, green: green, blue: blue, alpha: alpha)
        guard diffInDays >= creationDate && diffInDays <= untilDate && habitDays.contains(currentweekday)
            else {
            return nil
        }
        return Habit(title: title, imageName: systemImageName, target: target, numberOfCompletions: numberOfCompletions, units: units, identifier: document.documentID, creationDate: creationDate,untilDate: untilDate, habitDays: habitDays, color: habitIconColor)
    }
}
