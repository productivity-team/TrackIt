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
    }
    
    static func stats(from document: DocumentSnapshot) -> Stats? {
        guard let dict = document.data(),
              let title = dict[Key.title.rawValue] as? String,
              let systemImageName = dict[Key.imageName.rawValue] as? String,
              let target = dict[Key.target.rawValue] as? String,
              let units = dict[Key.units.rawValue] as? String,
              let habitProgress = dict[Key.habitProgress.rawValue] as? [String:Int]
        else {
            return nil
        }

        return Stats(title: title, imageName: systemImageName, target: target, units: units, identifier: document.documentID, habitProgress: habitProgress)
    }
}

