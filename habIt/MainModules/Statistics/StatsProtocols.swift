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
    func reloadData()
}

protocol StatsViewOutput: class {
    func didLoadView()
    func didPullRefesh()
    func countStats() -> Int
    func getCellByIndentifier(id: Int) -> StatsViewModel
}

protocol StatsInteractorInput: class {
    func observeItems()
}

protocol StatsInteractorOutput: class {
    func didLoad(stats: [Stats])
    func didRecieve(error: Error)
}

protocol StatsRouterInput: class {
}
