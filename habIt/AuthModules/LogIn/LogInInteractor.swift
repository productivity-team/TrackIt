//
//  LogInInteractor.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 08.04.2021.
//  
//

import Foundation
import FirebaseAuth

final class LogInInteractor {
    weak var output: LogInInteractorOutput?
}

extension LogInInteractor: LogInInteractorInput {
    
    
    //вход в аккаунт
    func logInUser(email: String?, password: String?) {
        
        Auth.auth().signIn(withEmail: email!, password: password!) { authResult,error in
            if let err = error {
                //вызываем поп ап с ошибкой
                let message = err.localizedDescription
                self.output?.showAlert(message: message)
                
            } else {
                //Navigate to the main view controller
                self.output?.toMenu()
                UserDefaults.standard.set(true, forKey: "LoggedIn")
            }
        }
        
    }
    
}
