//
//  StatsContainer.swift
//  tabbar
//
//  Created by kjhfsjdgfhk on 10.04.2021.
//  
//

import UIKit

final class StatsContainer {
    let input: StatsModuleInput
	let viewController: UIViewController
	private(set) weak var router: StatsRouterInput!

	class func assemble() -> StatsContainer { //with context: StatsContext
        let router = StatsRouter()
        let interactor = StatsInteractor()
        let presenter = StatsPresenter(router: router, interactor: interactor)
		let viewController = StatsViewController(output: presenter)

		presenter.view = viewController
		//presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return StatsContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: StatsModuleInput, router: StatsRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct StatsContext {
	weak var moduleOutput: StatsModuleOutput?
}
