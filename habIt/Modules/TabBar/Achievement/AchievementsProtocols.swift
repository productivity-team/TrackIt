//
//  AchievementsProtocols.swift
//  tabbar
//
//  Created by kjhfsjdgfhk on 10.04.2021.
//  
//

import Foundation

protocol AchievementsModuleInput {
	var moduleOutput: AchievementsModuleOutput? { get }
}

protocol AchievementsModuleOutput: class {
}

protocol AchievementsViewInput: class {
}

protocol AchievementsViewOutput: class {
}

protocol AchievementsInteractorInput: class {
}

protocol AchievementsInteractorOutput: class {
}

protocol AchievementsRouterInput: class {
}
