//
//  TabBarPresenter.swift
//  test
//
//  Created by kjhfsjdgfhk on 09.04.2021.
//  
//

import Foundation
import UIKit

final class TabBarPresenter {
	weak var view: TabBarViewInput?
    weak var moduleOutput: TabBarModuleOutput?

	private let router: TabBarRouterInput
	private let interactor: TabBarInteractorInput

    init(router: TabBarRouterInput, interactor: TabBarInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
    
}

extension TabBarPresenter: TabBarModuleInput {
}

extension TabBarPresenter: TabBarViewOutput {
    func didLoadView() {
        self.interactor.load()
    }
    
}

extension TabBarPresenter: TabBarInteractorOutput {
    func didLoad(Items: [itemInfo]) {
        self.view?.loadTabBarItems(Items: Items)
        
        self.view?.showTabBar(items: self.router.displayTabBar())
        
        
//        self.view?.showTabBar(items: [MenuViewController(), StatsViewController(), AchieveViewController(), SettingsViewController()])
    }
    
}
