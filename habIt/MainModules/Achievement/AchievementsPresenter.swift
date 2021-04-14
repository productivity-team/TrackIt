//
//  AchievementsPresenter.swift
//  tabbar
//
//  Created by kjhfsjdgfhk on 10.04.2021.
//  
//

import Foundation

final class AchievementsPresenter {
	weak var view: AchievementsViewInput?
    weak var moduleOutput: AchievementsModuleOutput?

	private let router: AchievementsRouterInput
	private let interactor: AchievementsInteractorInput

    init(router: AchievementsRouterInput, interactor: AchievementsInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension AchievementsPresenter: AchievementsModuleInput {
}

extension AchievementsPresenter: AchievementsViewOutput {
}

extension AchievementsPresenter: AchievementsInteractorOutput {
}
