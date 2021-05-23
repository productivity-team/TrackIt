//
//  HabitProgressManager.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 21.05.2021.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth


protocol HabitProgressManagerDescriprion {
    
    func getHabitProgress(completion: @escaping (Result<HabitProgress, Error>) -> Void)
}

final class HabitProgressManager: HabitProgressManagerDescriprion {
    
    private let database = Firestore.firestore()
    static let shared: HabitProgressManagerDescriprion = HabitProgressManager()
    
    let user = Auth.auth().currentUser
    
    private init() {}
    
    func getHabitProgress(completion: @escaping (Result<HabitProgress, Error>) -> Void) {
        
        if let user = self.user {
            let uid = user.uid
            let habit = HabitViewController.tappedHabitName
            database.collection("users").document(uid).collection("habits").document(habit).getDocument { (document, error) in
                
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                if document != nil && document!.exists {
                    guard let documentData = document
                    else {
                        completion(.failure(NetworkError.unexpected))
                        return
                    }
                    
                    let habitProgress = HabitProgressConverter.habitProgress(from: documentData)
                    completion(.success(habitProgress!))
                }
            }
        }
    }
    
    final class HabitProgressConverter {
        enum Key: String {
            case title
            case habitColor
            case target
            case units
        }
        
        static func habitProgress(from document: DocumentSnapshot) -> HabitProgress? {
            guard let dict = document.data(),
                  let title = dict[Key.title.rawValue] as? String,
                  let habitColor = dict[Key.habitColor.rawValue] as? [Double],
                  let target = dict[Key.target.rawValue] as? String,
                  let units = dict[Key.units.rawValue] as? String
            else {
                return nil
            }
            return HabitProgress(title: title, habitColor: habitColor, target: target, units: units, identifier: document.documentID)
        }
        
    }
    
}
