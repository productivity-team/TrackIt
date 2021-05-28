//
//  StatsViewController.swift
//  tabbar
//
//  Created by kjhfsjdgfhk on 10.04.2021.
//  
//

import UIKit

final class StatsViewController: UIViewController {
	private let output: StatsViewOutput
    private let tableView = UITableView()
    var totalNumberOfDays = Int()

    init(output: StatsViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        let background = UIColor(red: 238/255, green: 246/255, blue: 251/255, alpha: 1)
        title = "Статистика"
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(didPullRefesh), for: .valueChanged)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = background
        
        view.addSubview(tableView)
        
        tableView.register(StatsTableViewCell.self, forCellReuseIdentifier: "StatsTableViewCell")
        
        output.didLoadView()
        view.backgroundColor = background
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.pin.all()
    }
    
    @objc
    private func didPullRefesh() {
        output.didPullRefesh()
    }
    
}

extension StatsViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.countStats()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StatsTableViewCell", for: indexPath) as? StatsTableViewCell else {
            return .init()
        }
        totalNumberOfDays = output.progressCount(with: output.getCellByIndentifier(id: indexPath.row))
        cell.configure(with: output.getCellByIndentifier(id: indexPath.row), totalNumberOfDays: totalNumberOfDays)
        cell.backgroundColor = UIColor(red: 238/255, green: 246/255, blue: 251/255, alpha: 1)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 360
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

extension StatsViewController: StatsViewInput {
    func reloadData() {
        self.tableView.reloadData()
    }
}
