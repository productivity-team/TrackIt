//
//  StatsProtocols.swift
//  tabbar
//
//  Created by kjhfsjdgfhk on 10.04.2021.
//  
//

import Foundation

protocol StatsModuleInput {
	var moduleOutput: StatsModuleOutput? { get }
}

protocol StatsModuleOutput: class {
}

protocol StatsViewInput: class {
}

protocol StatsViewOutput: class {
}

protocol StatsInteractorInput: class {
}

protocol StatsInteractorOutput: class {
}

protocol StatsRouterInput: class {
}
