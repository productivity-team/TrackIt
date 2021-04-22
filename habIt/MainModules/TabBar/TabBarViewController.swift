//
//  TabBarViewController.swift
//  test
//
//  Created by kjhfsjdgfhk on 09.04.2021.
//  
//

import UIKit

final class TabBarViewController: UIViewController {
	private let output: TabBarViewOutput
    private let tabBar = UITabBarController()
    
    var tabBarItems: [itemInfo] = []
    
    init(output: TabBarViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        output.didLoadView()
        tabBar.selectedIndex = 1
        
	}
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tabBar.modalPresentationStyle = .fullScreen
        
        present(tabBar, animated: false, completion: nil)
    }
}

extension TabBarViewController: TabBarViewInput {
    func loadTabBarItems(Items: [itemInfo]) {
        tabBarItems = Items
    }
    
    func showTabBar(items: [UIViewController]) {
        
        
        
        tabBar.setViewControllers(items, animated: true)
        guard let items = tabBar.tabBar.items else {
            return
        }
        for i in 0..<items.count {
            items[i].image = UIImage(systemName: tabBarItems[i].systemImageName)
            items[i].title = tabBarItems[i].description
        }
    }
    
}
