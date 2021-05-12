//
//  MenuPresenter.swift
//  test
//
//  Created by kjhfsjdgfhk on 09.04.2021.
//  
//

import Foundation

final class MenuPresenter {
    weak var view: MenuViewInput?
    weak var moduleOutput: MenuModuleOutput?
    
    private let router: MenuRouterInput
    private let interactor: MenuInteractorInput
    
    var items: [HabitViewModel] = []
    
    
    init(router: MenuRouterInput, interactor: MenuInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
    private func viewModel(from habit: Habit) -> HabitViewModel {
        let numberOfCompletions = (habit.numberOfCompletions ?? "0")
        return HabitViewModel(title: habit.title,
                              imageName: habit.systemImageName,
                              target: habit.target,
                              numberOfCompletions: numberOfCompletions,
                              units: habit.units)
    }
}

extension MenuPresenter: MenuModuleInput {
}

extension MenuPresenter: MenuViewOutput {
    func didPullRefesh() {
        interactor.observeItems()
    }
    
    func didSelectItem(at index: Int) {
        let model = items[index]
        router.showHabit(model: model)
    }
    
    func getCellByIndentifier(id: Int) -> HabitViewModel {
        return items[id]
    }
    
    func countHabits() -> Int {
        return items.count
    }
    
    //нажали на привычку
    func didTapAddButton() {
        self.router.openAddScreen()
    }
    
    func didLoadView() {
        interactor.observeItems()
    }
    
}

extension MenuPresenter: MenuInteractorOutput {
    func didRecieve(error: Error) {
    }
    
    func didLoad(habits: [Habit]) {
        self.items = habits.map { viewModel(from: $0) }
        self.view?.reloadData()
    }
}

