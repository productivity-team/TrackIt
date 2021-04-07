//
//  File.swift
//  habIt
//
//  Created by kjhfsjdgfhk on 31.03.2021.
//

import UIKit
import PinLayout

class HomeViewController: UIViewController {
    private let tabBar = UITabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let menu = UINavigationController(rootViewController: MenuViewController())
        let stats = UINavigationController(rootViewController: StatsViewController())
        let achievements = UINavigationController(rootViewController: AchieveViewController())
        let settings = UINavigationController(rootViewController: SettingsViewController())
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





