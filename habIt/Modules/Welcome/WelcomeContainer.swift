//
//  WelcomeContainer.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 07.04.2021.
//  
//

import UIKit

final class WelcomeContainer {
    let input: WelcomeModuleInput
	let viewController: UIViewController
	private(set) weak var router: WelcomeRouterInput!

	class func assemble(with context: WelcomeContext) -> WelcomeContainer {
        let router = WelcomeRouter()
        let interactor = WelcomeInteractor()
        let presenter = WelcomePresenter(router: router, interactor: interactor)
		let viewController = WelcomeViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput
        
        
        router.sourceViewController = viewController
        
        
		interactor.output = presenter

        return WelcomeContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: WelcomeModuleInput, router: WelcomeRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct WelcomeContext {
	weak var moduleOutput: WelcomeModuleOutput?
}
