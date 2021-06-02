//
//  CreateHabitContainer.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 22.04.2021.
//  
//

import UIKit

final class CreateHabitContainer {
    let input: CreateHabitModuleInput
	let viewController: UIViewController
	private(set) weak var router: CreateHabitRouterInput!

	class func assemble(with context: CreateHabitContext) -> CreateHabitContainer {
        let router = CreateHabitRouter()
        let interactor = CreateHabitInteractor()
        let presenter = CreateHabitPresenter(router: router, interactor: interactor)
		let viewController = CreateHabitViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput
        router.sourceViewController = viewController
        
		interactor.output = presenter

        return CreateHabitContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: CreateHabitModuleInput, router: CreateHabitRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct CreateHabitContext {
	weak var moduleOutput: CreateHabitModuleOutput?
}
