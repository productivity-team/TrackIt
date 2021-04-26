//
//  ColorPickerContainer.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 25.04.2021.
//  
//

import UIKit

final class ColorPickerContainer {
    let input: ColorPickerModuleInput
	let viewController: UIViewController
	private(set) weak var router: ColorPickerRouterInput!

	class func assemble(with context: ColorPickerContext) -> ColorPickerContainer {
        let router = ColorPickerRouter()
        let interactor = ColorPickerInteractor()
        let presenter = ColorPickerPresenter(router: router, interactor: interactor)
		let viewController = ColorPickerViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput
        router.sourceViewController = viewController

		interactor.output = presenter

        return ColorPickerContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: ColorPickerModuleInput, router: ColorPickerRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct ColorPickerContext {
	weak var moduleOutput: ColorPickerModuleOutput?
}
