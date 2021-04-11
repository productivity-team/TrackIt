//
//  SettingsContainer.swift
//  tabbar
//
//  Created by kjhfsjdgfhk on 10.04.2021.
//  
//

import UIKit

final class SettingsContainer {
    let input: SettingsModuleInput
	let viewController: UIViewController
	private(set) weak var router: SettingsRouterInput!

	class func assemble() -> SettingsContainer {
        let router = SettingsRouter()
        let interactor = SettingsInteractor()
        let presenter = SettingsPresenter(router: router, interactor: interactor)
		let viewController = SettingsViewController(output: presenter)

		presenter.view = viewController
		//presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return SettingsContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: SettingsModuleInput, router: SettingsRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct SettingsContext {
	weak var moduleOutput: SettingsModuleOutput?
}
