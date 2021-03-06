//
//  HabitContainer.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 22.04.2021.
//  
//

import UIKit

final class HabitContainer {
    let input: HabitModuleInput
	let viewController: UIViewController
	private(set) weak var router: HabitRouterInput!

	class func assemble(with context: HabitContext) -> HabitContainer {
        let router = HabitRouter()
        let interactor = HabitInteractor()
        let presenter = HabitPresenter(router: router, interactor: interactor)
		let viewController = HabitViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput
        presenter.habitProgress.title = context.title
        presenter.habitProgress.target = context.target
        presenter.habitProgress.numberOfCompletions = context.numberOfCompletions
        presenter.habitProgress.units = context.units
        presenter.habitProgress.habitColor = context.habitIconColor
        router.sourceViewController = viewController

		interactor.output = presenter

        return HabitContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: HabitModuleInput, router: HabitRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct HabitContext {
    weak var moduleOutput: HabitModuleOutput?
    var title: String
    var target: String
    var numberOfCompletions: String
    var units: String
    var habitIconColor: UIColor
}
