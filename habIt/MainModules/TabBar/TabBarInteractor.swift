//
//  TabBarInteractor.swift
//  test
//
//  Created by kjhfsjdgfhk on 09.04.2021.
//  
//

import Foundation

final class TabBarInteractor {
	weak var output: TabBarInteractorOutput?
    
    var givenDescription: [itemInfo] =
        [itemInfo(named: "habitStats", description: "Статистика"),
         itemInfo(named: "habitMenu", description: "Меню"),
         itemInfo(named: "habitSettings", description: "Настройки")]
}

extension TabBarInteractor: TabBarInteractorInput {
    func load() {
        self.output?.didLoad(Items: givenDescription)
    }
}
