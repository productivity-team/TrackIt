//
//  StatsInteractor.swift
//  tabbar
//
//  Created by kjhfsjdgfhk on 10.04.2021.
//  
//

import Foundation

final class StatsInteractor {
	weak var output: StatsInteractorOutput?
    
    private let statsManager: StatsManagerDescriprion = StatsManager.shared
}

extension StatsInteractor: StatsInteractorInput {
    
    func observeItems() {
        statsManager.observeStats { [weak self] (result) in
            DispatchQueue.main.async {
            switch result {
            case .success(let stats):
                self?.output?.didLoad(stats: stats)
            case .failure(let error):
                self?.output?.didRecieve(error: error)
            }
            }
        }
    }
    
}
