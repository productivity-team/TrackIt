//
//  ColorPickerPresenter.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 25.04.2021.
//  
//

import Foundation

final class ColorPickerPresenter {
	weak var view: ColorPickerViewInput?
    weak var moduleOutput: ColorPickerModuleOutput?

	private let router: ColorPickerRouterInput
	private let interactor: ColorPickerInteractorInput

    init(router: ColorPickerRouterInput, interactor: ColorPickerInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension ColorPickerPresenter: ColorPickerModuleInput {
}

extension ColorPickerPresenter: ColorPickerViewOutput {
}

extension ColorPickerPresenter: ColorPickerInteractorOutput {
}
