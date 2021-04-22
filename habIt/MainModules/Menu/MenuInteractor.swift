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
    var testHabits = TestHabits()
}

extension MenuInteractor: MenuInteractorInput {
    
    func getHabits() -> [HabitViewModel] {
        return testHabits.habits
    }

}
