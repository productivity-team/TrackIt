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

    init(router: StatsRouterInput, interactor: StatsInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension StatsPresenter: StatsModuleInput {
}

extension StatsPresenter: StatsViewOutput {
}

extension StatsPresenter: StatsInteractorOutput {
}
