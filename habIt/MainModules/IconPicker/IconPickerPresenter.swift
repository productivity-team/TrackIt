//
//  IconPickerPresenter.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 05.05.2021.
//  
//

import Foundation

final class IconPickerPresenter {
	weak var view: IconPickerViewInput?
    weak var moduleOutput: IconPickerModuleOutput?

	private let router: IconPickerRouterInput
	private let interactor: IconPickerInteractorInput

    init(router: IconPickerRouterInput, interactor: IconPickerInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension IconPickerPresenter: IconPickerModuleInput {
}

extension IconPickerPresenter: IconPickerViewOutput {
    func selectedIconButtonPressed() {
        router.toCreateHabit()
    }
}

extension IconPickerPresenter: IconPickerInteractorOutput {
}
