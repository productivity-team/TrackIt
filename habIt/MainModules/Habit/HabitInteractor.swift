//
//  HabitInteractor.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 22.04.2021.
//  
//

import Foundation
import Firebase

final class HabitInteractor {
	weak var output: HabitInteractorOutput?
}

extension HabitInteractor: HabitInteractorInput {
    
    func updateProgress(tappedHabitName: String, updateKey: String, numberOfCompletions: Int) {

        let db = Firestore.firestore()
        let uid = Auth.auth().currentUser!.uid

        db.collection("users").document(uid).collection("habits").document(tappedHabitName).updateData([
            "habitProgress.\(updateKey)": numberOfCompletions
        ]) { err in
            if let err = err {
                print("Error writing document: \(err.localizedDescription)")
            } else {
                print("Document successfully written!")
                self.output?.openMenu()
            }
        }
    }
    
}
