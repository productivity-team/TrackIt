//
//  MenuContainer.swift
//  test
//
//  Created by kjhfsjdgfhk on 09.04.2021.
//  
//

import UIKit

final class MenuContainer {
    let input: MenuModuleInput
	let viewController: UIViewController
	private(set) weak var router: MenuRouterInput!

	class func assemble(with context: MenuContext) -> MenuContainer {
        let router = MenuRouter()
        let interactor = MenuInteractor()
        let presenter = MenuPresenter(router: router, interactor: interactor)
		let viewController = MenuViewController(output: presenter)

		presenter.view = viewController
        presenter.moduleOutput = context.moduleOutput
        router.sourceViewController = viewController

		interactor.output = presenter

        return MenuContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: MenuModuleInput, router: MenuRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct MenuContext {
	weak var moduleOutput: MenuModuleOutput?
}


struct HabitInfo {
   
    
}
