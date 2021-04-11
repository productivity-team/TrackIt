//
//  TabBarContainer.swift
//  test
//
//  Created by kjhfsjdgfhk on 09.04.2021.
//  
//

import UIKit

final class TabBarContainer {
    let input: TabBarModuleInput
	let viewController: UIViewController
	private(set) weak var router: TabBarRouterInput!

	class func assemble() -> TabBarContainer {            //with context: TabBarContext
        let router = TabBarRouter()
        let interactor = TabBarInteractor()
        let presenter = TabBarPresenter(router: router, interactor: interactor)
		let viewController = TabBarViewController(output: presenter)

		presenter.view = viewController
		//presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter
        return TabBarContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: TabBarModuleInput, router: TabBarRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct TabBarContext {
	weak var moduleOutput: TabBarModuleOutput?
}



struct itemInfo {
    let systemImageName: String
    let description: String
}
