//
//  CreateHabitInteractor.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 22.04.2021.
//
//

import Foundation
import Firebase

final class CreateHabitInteractor {
    weak var output: CreateHabitInteractorOutput?
}


extension CreateHabitInteractor: CreateHabitInteractorInput {
    
    //сохранение привычки в базу
    func saveHabit(creationDate: Int, untilDate: Int, title: String, imageName: String, habitColor: [Double], target: String, units: String, habitDays: [Int], habitProgress: [String: Int]) {
        
        
        let db = Firestore.firestore()
        let uid = Auth.auth().currentUser!.uid

        
        db.collection("users").document(uid).collection("habits").document(title).setData([
                                                                                            "creationDate": creationDate,
                                                                                            "untilDate": untilDate,
                                                                                            "title": title,
                                                                                            "imageName": imageName,
                                                                                            "habitColor": habitColor,
                                                                                            "target": target,
                                                                                            "units": units,
                                                                                            "habitDays": habitDays,
                                                                                            "habitProgress": habitProgress,
                                                                                            "timestamp" : Timestamp()
        ]) { err in
            if let err = err {
                print("Error writing document: \(err.localizedDescription)")
            } else {
                self.output?.closeHabitCreation()
            }
        }
    }
}


