//
//  MenuProtocols.swift
//  test
//
//  Created by kjhfsjdgfhk on 09.04.2021.
//  
//

import Foundation

protocol MenuModuleInput {
	var moduleOutput: MenuModuleOutput? { get }
}

protocol MenuModuleOutput: class {
}

protocol MenuViewInput: class {
    func reloadData()
}

protocol MenuViewOutput: class {
//    var habitsViewModels: [HabitViewModel] { get }
    func didTapAddButton()
    func countHabits() -> Int
    func getCellByIndentifier(id: Int) -> HabitViewModel
    func didSelectHabit(at index: Int)
    func didLoadView()
    func didPullRefesh()
    func configureCollectionViewCell(cell: CalendarCollectionViewCell, addedDays: Int) -> CalendarCollectionViewCell
    func scrollToDate(date: Date) -> IndexPath
}

protocol MenuInteractorInput: class {
    func observeItems()
}

protocol MenuInteractorOutput: class {
    func didLoad(habits: [Habit])
    func didRecieve(error: Error)
    
}

protocol MenuRouterInput: class {
    func openAddScreen()
    func showHabit(model: HabitViewModel)
}
