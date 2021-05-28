//
//  StatsPresenter.swift
//  tabbar
//
//  Created by kjhfsjdgfhk on 10.04.2021.
//  
//

import Foundation

final class StatsPresenter {
	weak var view: StatsViewInput?
    weak var moduleOutput: StatsModuleOutput?

	private let router: StatsRouterInput
	private let interactor: StatsInteractorInput
    
    var items: [StatsViewModel] = []

    init(router: StatsRouterInput, interactor: StatsInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
    
    private func viewModel(from stats: Stats) -> StatsViewModel {
        return StatsViewModel(title: stats.title,
                              imageName: stats.systemImageName,
                              target: stats.target,
                              units: stats.units,
                              habitProgress: stats.habitProgress,
                              creationDate: stats.creationDate,
                              untilDate: stats.untilDate,
                              habitDays: stats.habitDays,
                              color: stats.habitStatsColor)
    }
}

extension StatsPresenter: StatsModuleInput {
}

extension StatsPresenter: StatsViewOutput {
    
    func didPullRefesh() {
        interactor.observeItems()
    }
    
    func getCellByIndentifier(id: Int) -> StatsViewModel {
        return items[id]
    }
    
    func countStats() -> Int {
        return items.count
    }
    
    func didLoadView() {
        interactor.observeItems()
    }
    
    func progressCount(with model: StatsViewModel) -> Int {
        let ReferenceDate = Date.init(timeIntervalSinceReferenceDate: 0)
        var totalNumberOfDays = 0
        let startIndex = model.creationDate
        let endIndex = model.untilDate
        let differenceInIndices: Int  = endIndex - startIndex
        
        
        var addedDaysDateComp = DateComponents()
        addedDaysDateComp.day = startIndex
        let startDate = Calendar.current.date(byAdding: addedDaysDateComp, to: ReferenceDate)
        let startWeekday = Calendar.current.component(.weekday, from: startDate!)
        
        addedDaysDateComp.day = endIndex
        let endDate = Calendar.current.date(byAdding: addedDaysDateComp, to: ReferenceDate)
        let endWeekday = Calendar.current.component(.weekday, from: endDate!)
         
        for i in model.habitDays {
            if i >= startWeekday {totalNumberOfDays = totalNumberOfDays + 1}
            if i <= endWeekday {totalNumberOfDays = totalNumberOfDays + 1}
            totalNumberOfDays = totalNumberOfDays - 1
            totalNumberOfDays = totalNumberOfDays +  differenceInIndices/7
        }
        return totalNumberOfDays
    }
}

extension StatsPresenter: StatsInteractorOutput {
    func didRecieve(error: Error) {
    }
    
    func didLoad(stats: [Stats]) {
        self.items = stats.map { viewModel(from: $0) }
        self.view?.reloadData()
    }
    
}
