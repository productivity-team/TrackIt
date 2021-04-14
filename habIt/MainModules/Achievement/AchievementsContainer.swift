//
//  AchievementsContainer.swift
//  tabbar
//
//  Created by kjhfsjdgfhk on 10.04.2021.
//  
//

import UIKit

final class AchievementsContainer {
    let input: AchievementsModuleInput
	let viewController: UIViewController
	private(set) weak var router: AchievementsRouterInput!

	class func assemble() -> AchievementsContainer {
        let router = AchievementsRouter()
        let interactor = AchievementsInteractor()
        let presenter = AchievementsPresenter(router: router, interactor: interactor)
		let viewController = AchievementsViewController(output: presenter)

		presenter.view = viewController
		//presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return AchievementsContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: AchievementsModuleInput, router: AchievementsRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct AchievementsContext {
	weak var moduleOutput: AchievementsModuleOutput?
}
