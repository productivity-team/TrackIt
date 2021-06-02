//
//  IconPickerContainer.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 05.05.2021.
//  
//

import UIKit

final class IconPickerContainer {
    let input: IconPickerModuleInput
	let viewController: UIViewController
	private(set) weak var router: IconPickerRouterInput!

	class func assemble(with context: IconPickerContext) -> IconPickerContainer {
        let router = IconPickerRouter()
        let interactor = IconPickerInteractor()
        let presenter = IconPickerPresenter(router: router, interactor: interactor)
		let viewController = IconPickerViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput
        router.sourceViewController = viewController

		interactor.output = presenter

        return IconPickerContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: IconPickerModuleInput, router: IconPickerRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct IconPickerContext {
	weak var moduleOutput: IconPickerModuleOutput?
}
