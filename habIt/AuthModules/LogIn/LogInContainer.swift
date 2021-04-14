//
//  LogInContainer.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 08.04.2021.
//  
//

import UIKit

final class LogInContainer {
    let input: LogInModuleInput
	let viewController: UIViewController
	private(set) weak var router: LogInRouterInput!

	class func assemble(with context: LogInContext) -> LogInContainer {
        let router = LogInRouter()
        let interactor = LogInInteractor()
        let presenter = LogInPresenter(router: router, interactor: interactor)
		let viewController = LogInViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return LogInContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: LogInModuleInput, router: LogInRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct LogInContext {
	weak var moduleOutput: LogInModuleOutput?
}
