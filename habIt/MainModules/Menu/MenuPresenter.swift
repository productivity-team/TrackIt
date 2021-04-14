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

    init(router: MenuRouterInput, interactor: MenuInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
    
//    private (set) var citiesViewModels: [CityViewModel] = []
    
}

extension MenuPresenter: MenuModuleInput {
}

extension MenuPresenter: MenuViewOutput {
    
    func didTapAddButton() {
        self.router.openAddScreen()
    }
}

extension MenuPresenter: MenuInteractorOutput {
}

