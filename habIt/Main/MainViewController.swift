//
//  File.swift
//  habIt
//
//  Created by kjhfsjdgfhk on 31.03.2021.
//

import Foundation
import SwiftUI
import PinLayout

class MainView: UIViewController {
    private let tabBar = UITabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let menu = UINavigationController(rootViewController: menuVC())
        let stats = UINavigationController(rootViewController: statsVC())
        let achievements = UINavigationController(rootViewController: achievementsVC())
        let settings = UINavigationController(rootViewController: settingsVC())
        menu.title = "Меню"
        stats.title = "Статистика"
        achievements.title = "Достижения"
        settings.title = "Настройки"
        
        
        
        
        
        tabBar.setViewControllers([menu, stats, achievements, settings], animated: false)
        guard let items = tabBar.tabBar.items else {
            return
        }
        
        let images = ["calendar", "wallet.pass", "star", "gear"]
        
        for i in 0..<items.count {
            items[i].image = UIImage(systemName: images[i])
            
        }
        
        

    }
    override func viewDidAppear(_ animated: Bool) {
        tabBar.modalPresentationStyle = .fullScreen
        present(tabBar, animated: true)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
      
}
}





