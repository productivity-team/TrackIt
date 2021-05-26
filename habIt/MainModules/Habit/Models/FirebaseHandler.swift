//
//  FirebaseHandler.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 24.05.2021.
//

import Foundation
import Firebase

class FirebaseHandler {
    private var db: Firestore!
    private var uid: String!
    
    static var shared: FirebaseHandler = {
        let firebaseHandler = FirebaseHandler()
        firebaseHandler.db = Firestore.firestore()
        firebaseHandler.uid = Auth.auth().currentUser!.uid
        return firebaseHandler
    }()
    
    private init() { }
    
    func resetProgress(tappedHabitName: String, updateKey: String) {

        let db = Firestore.firestore()
        let uid = Auth.auth().currentUser!.uid

        db.collection("users").document(uid).collection("habits").document(tappedHabitName).updateData([
            "habitProgress.\(updateKey)": 0
        ]) { err in
            if let err = err {
                print("Error writing document: \(err.localizedDescription)")
            }
        }
    }
    
    func deleteHabit(habitName: String) {
        
        let db = Firestore.firestore()
        let uid = Auth.auth().currentUser!.uid
        
        db.collection("users").document(uid).collection("habits").document(habitName).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            }
        }
    }
    
    
    
}


