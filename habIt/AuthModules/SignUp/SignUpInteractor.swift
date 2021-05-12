//
//  SignUpInteractor.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 10.04.2021.
//  
//

import Foundation
import Firebase
import FirebaseAuth

final class SignUpInteractor {
    weak var output: SignUpInteractorOutput?
}

extension SignUpInteractor: SignUpInteractorInput {
    
    //регистрация аккаунта
    func SignUpUser(name: String?, email: String?, password: String?) {
        
        Auth.auth().createUser(withEmail: email!, password: password!) { authResult, error in
            if let err = error {
                //вызываем поп ап с ошибкой
                let message = err.localizedDescription
                self.output?.showAlert(message: message)
                
            } else {
            
                //successfully created user, now store the user's name
                let db = Firestore.firestore()
                
                db.collection("users").addDocument(data: ["username": name ?? "User", "uid": authResult!.user.uid]) { (error) in
                    
                    if error != nil {
                        self.output?.showAlert(message: "Не удалось сохранить данные пользователя")
                    }
                }
                //Navigate to the menu screen
                self.output?.toMenu()
                
                UserDefaults.standard.set(true, forKey: "LoggedIn")
            }
        }
        
        
    }
    
}
