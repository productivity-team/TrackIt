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
        return StatsViewModel(title: stats.title)
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
    
}

extension StatsPresenter: StatsInteractorOutput {
    func didRecieve(error: Error) {
    }
    
    func didLoad(stats: [Stats]) {
        self.items = stats.map { viewModel(from: $0) }
        self.view?.reloadData()
    }
    
}
