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

let startDate = Date.init(timeIntervalSinceReferenceDate: 0)
let calendar = Calendar.current
let date = Date()
let diffInDays = calendar.dateComponents([.day], from: startDate, to: date).day

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
    
    private let collectionView: UICollectionView = {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .horizontal
        return UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //печатает текущий день недели
        let currentday = Calendar.current.component(.weekday, from: date)
        print(currentday)
        
        let background = UIColor(red: 238/255, green: 246/255, blue: 251/255, alpha: 1)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = background
        collectionView.showsHorizontalScrollIndicator = false
        
        view.addSubview(collectionView)
        
        collectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: "CalendarCollectionViewCell")
        
        title = "Меню"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddButton))
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(didPullRefesh), for: .valueChanged)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = background
        tableView.refreshControl = refreshControl
        
        view.addSubview(tableView)
        
        tableView.register(HabitTableViewCell.self, forCellReuseIdentifier: "HabitTableViewCell")
  
        output.didLoadView()
        view.backgroundColor = background
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        let firstMondayIndexPath = output.scrollToDate(date: Date())
        collectionView.scrollToItem(at: firstMondayIndexPath, at: .left, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewSafeAreaInsetsDidChange()
        collectionView.pin
            .top(view.pin.safeArea)
            .left()
            .right()
            .height(65)
        
        tableView.pin
            .below(of: collectionView)
            .marginVertical(0)
            .left()
            .right()
            .bottom()
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
        return 133
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.didSelectHabit(at: indexPath.row)
    }
    
}

extension MenuViewController: MenuViewInput {
    func reloadData() {
        self.tableView.refreshControl?.endRefreshing()
        self.tableView.reloadData()
    }
}

extension MenuViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        9999
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let addedDays = indexPath.row
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCollectionViewCell", for: indexPath) as? CalendarCollectionViewCell
        else {
            return .init()
        }
        
        if (indexPath.row == diffInDays) {
            cell.dayNumber.textColor = UIColor.red
            cell.dayName.textColor = UIColor.red
        } else {
            cell.dayNumber.textColor = UIColor.black
            cell.dayName.textColor = UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1)
        }
        return output.configureCollectionViewCell(cell: cell, addedDays: addedDays)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let avaliablewidth = collectionView.bounds.width
        let width = avaliablewidth/7
        let height = collectionView.bounds.height
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
