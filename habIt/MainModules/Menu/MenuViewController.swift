//
//  MenuViewController.swift
//  test
//
//  Created by kjhfsjdgfhk on 09.04.2021.
//  
//

import UIKit
import FirebaseFirestore
import FirebaseAuth


final class MenuViewController: UIViewController {
    private let output: MenuViewOutput
    private let tableView = UITableView()
    
    
    init(output: MenuViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Меню"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddButton))
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        tableView.backgroundColor = UIColor(red: 238/255, green: 246/255, blue: 251/255, alpha: 1)
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(didPullRefesh), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
        tableView.register(HabitTableViewCell.self, forCellReuseIdentifier: "HabitTableViewCell")
  
        view.addSubview(tableView)
        output.didLoadView()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.pin.all()
    }
    
    
    @objc
    private func didTapAddButton() {
        output.didTapAddButton()
    }
    @objc
    private func didPullRefesh() {
        output.didPullRefesh()
    }
    
}


extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.countHabits()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HabitTableViewCell", for: indexPath) as? HabitTableViewCell else {
            return .init()
        }
        cell.configure(with: output.getCellByIndentifier(id: indexPath.row))
        cell.backgroundColor = UIColor(red: 238/255, green: 246/255, blue: 251/255, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        output.didSelectItem(at: indexPath.row)
    }
    
}

extension MenuViewController: MenuViewInput {
    func reloadData() {                            
        self.tableView.refreshControl?.endRefreshing()
        self.tableView.reloadData()
    }
}
