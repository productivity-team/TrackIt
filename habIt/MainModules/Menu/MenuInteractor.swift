//
//  MenuInteractor.swift
//  test
//
//  Created by kjhfsjdgfhk on 09.04.2021.
//  
//

import Foundation

final class MenuInteractor {
	weak var output: MenuInteractorOutput?
//    var testHabits = TestHabits()
    
    private let habitManager: HabitManagerDescriprion = HabitsManager.shared
}

extension MenuInteractor: MenuInteractorInput {
    
    func observeItems() {
        habitManager.observeHabits { [weak self] (result) in
            DispatchQueue.main.async {
            switch result {
            case .success(let habits):
                self?.output?.didLoad(habits: habits)
            case .failure(let error):
                self?.output?.didRecieve(error: error)
            }
            }
        }
        
    }

}
