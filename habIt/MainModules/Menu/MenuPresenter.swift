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
                              units: habit.units,
                              creationDate: habit.creationDate,
                              untilDate: habit.creationDate,
                              habitDays: habit.habitDays)
    }
}

extension MenuPresenter: MenuModuleInput {
}

extension MenuPresenter: MenuViewOutput {
    func scrollToDate(date: Date) -> IndexPath {
        var firstMondayIndexPath = IndexPath()
        if let numberOfDays = calendar.dateComponents([.day], from: startDate, to: date).day {
            let extraDays: Int = numberOfDays % 7 // will = 0 for Mondays, 1 for Tuesday, etc ..
            let scrolledNumberOfDays = numberOfDays-extraDays
            firstMondayIndexPath = IndexPath(row: scrolledNumberOfDays, section: 0)
        }
        return (firstMondayIndexPath)
    }
    
    func configureCollectionViewCell(cell: CalendarCollectionViewCell, addedDays: Int) -> CalendarCollectionViewCell {
        
        func getNameOfDayFromNumber(weekday: Int) -> String {
            switch weekday {
            case 1:
                return ("Вс")
            case 2:
                return ("Пн")
            case 3:
                return ("Вт")
            case 4:
                return ("Ср")
            case 5:
                return ("Чт")
            case 6:
                return ("Пт")
            case 7:
                return ("Сб")
            default:
                return("Error. Impossible to get date")
            }
        }
        
        var addedDaysDateComp = DateComponents()
        addedDaysDateComp.day = addedDays
        let currentCellDate = Calendar.current.date(byAdding: addedDaysDateComp, to: startDate)
        if let cellDate = currentCellDate {
            cell.date = cellDate
            let dayNumber = Calendar.current.component(.day, from: cellDate)
            let dayName = Calendar.current.component(.weekday, from: cellDate)
            cell.configure(with: dayNumber, weekday: getNameOfDayFromNumber(weekday: dayName))
            
        }
        return cell
    }
    
    func didPullRefesh() {
        interactor.observeItems()
    }
    
    func didSelectHabit(at index: Int) {
        let model = items[index]
        router.showHabit(model: model)
    }
    
    func getCellByIndentifier(id: Int) -> HabitViewModel {
        return items[id]
    }
    
    func getCellNameByIndentifier(id: Int) -> String {
        items[id].title
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
    
    func updateRequired() -> Bool {
        return false
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
