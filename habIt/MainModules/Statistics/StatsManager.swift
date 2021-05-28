//
//  StatsManager.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 25.05.2021.
//

import Foundation
import FirebaseFirestore
import Firebase


protocol StatsManagerDescriprion {

    func observeStats(completion: @escaping (Result<[Stats], Error>) -> Void)
}

final class StatsManager: StatsManagerDescriprion {
    private let database = Firestore.firestore()
    static let shared: StatsManagerDescriprion = StatsManager()
    let user = Auth.auth().currentUser
    private init() {}
    func observeStats(completion: @escaping (Result<[Stats], Error>) -> Void) {
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
                
                let stats = documents.compactMap { StatsConverter.stats(from: $0) }
                completion(.success(stats))
            }
        }
    }
}

final class StatsConverter {
    enum Key: String {
        case title
        case imageName
        case target
        case units
        case habitProgress
        case creationDate
        case untilDate
        case habitDays
        case habitColor
    }
    
    static func stats(from document: DocumentSnapshot) -> Stats? {
        guard let dict = document.data(),
              let title = dict[Key.title.rawValue] as? String,
              let systemImageName = dict[Key.imageName.rawValue] as? String,
              let target = dict[Key.target.rawValue] as? String,
              let units = dict[Key.units.rawValue] as? String,
              let habitProgress = dict[Key.habitProgress.rawValue] as? [String:Int],
              let creationDate = dict[Key.creationDate.rawValue] as? Int,
              let untilDate = dict[Key.untilDate.rawValue] as? Int,
              let habitDays = dict[Key.habitDays.rawValue] as? [Int],
              let habitColor = dict[Key.habitColor.rawValue] as? [Double]
            
            
        else {
            return nil
        }
        let red = CGFloat(habitColor[0])
        let green = CGFloat(habitColor[1])
        let blue = CGFloat(habitColor[2])
        let alpha = CGFloat(habitColor[3])
        let habitStatsColor = UIColor(displayP3Red: red, green: green, blue: blue, alpha: alpha)

        return Stats(title: title, imageName: systemImageName, target: target, units: units, identifier: document.documentID, habitProgress: habitProgress, creationDate: creationDate,untilDate: untilDate, habitDays: habitDays, color: habitStatsColor)
    }
}

