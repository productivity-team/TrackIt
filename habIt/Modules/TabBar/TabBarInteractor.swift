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
        [itemInfo(systemImageName: "wallet.pass", description: "Статистика"),
         itemInfo(systemImageName: "calendar", description: "Меню"),
         itemInfo(systemImageName: "gear", description: "Настройки")]
    
}

extension TabBarInteractor: TabBarInteractorInput {
    func load() {
        self.output?.didLoad(Items: givenDescription)
        
    }
}
