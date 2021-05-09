//
//  IconPickerViewController.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 05.05.2021.
//  
//

import UIKit
import PinLayout
import EzPopup
import M13Checkbox

struct IconData {
    var title: String
    var backgroundImage: UIImage
}


final class IconPickerViewController: UIViewController {
    private let output: IconPickerViewOutput
    private let saveButton = UIButton()
    
    fileprivate let icons = [
        IconData(title: "sport", backgroundImage: UIImage(named: "sport")!),
        IconData(title: "study", backgroundImage: UIImage(named: "study")!),
        IconData(title: "food", backgroundImage: UIImage(named: "food")!),
        IconData(title: "task", backgroundImage: UIImage(named: "task")!),
        IconData(title: "health", backgroundImage: UIImage(named: "health")!),
        IconData(title: "notes", backgroundImage: UIImage(named: "notes")!),
        IconData(title: "car", backgroundImage: UIImage(named: "car")!),
        IconData(title: "pet", backgroundImage: UIImage(named: "pet")!),
        IconData(title: "chat", backgroundImage: UIImage(named: "chat")!),
        IconData(title: "computer", backgroundImage: UIImage(named: "computer")!),
        IconData(title: "clothes", backgroundImage: UIImage(named: "clothes")!),
        IconData(title: "money", backgroundImage: UIImage(named: "money")!),
        IconData(title: "water", backgroundImage: UIImage(named: "water")!),
        IconData(title: "run", backgroundImage: UIImage(named: "run")!),
        IconData(title: "shopping", backgroundImage: UIImage(named: "shopping")!),
        IconData(title: "cleaning", backgroundImage: UIImage(named: "cleaning")!),
        IconData(title: "smoking", backgroundImage: UIImage(named: "smoking")!),
        IconData(title: "alcohol", backgroundImage: UIImage(named: "alcohol")!),
        IconData(title: "games", backgroundImage: UIImage(named: "games")!),
        IconData(title: "meditation", backgroundImage: UIImage(named: "meditation")!)
    ]

    static var iconName = "task"
    static var selectedIcon = UIImage(named: iconName)
    
    
    init(output: IconPickerViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        view.backgroundColor = UIColor(red: 249/255, green: 255/255, blue: 255/255, alpha: 1)
        
        saveButton.setTitle("Выбрать", for: .normal)
        saveButton.titleLabel?.font = UIFont(name: "Lato-Medium", size: 20)
        saveButton.backgroundColor = UIColor(red: 182/255, green: 230/255, blue: 255/255, alpha: 1)
        saveButton.layer.cornerRadius = 10
        saveButton.setTitleColor(UIColor(red: 48/255, green: 48/255, blue: 48/255, alpha: 1), for: .normal)
        saveButton.addTarget(self, action: #selector(selectedIconButtonPressed), for: .touchUpInside)
        view.addSubview(saveButton)
    }
    
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        collectionView.register(IconPickerCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        saveButton.pin
            .height(50)
            .width(160)
            .bottom(40)
            .hCenter()
    }
    
    
    @objc
    private func selectedIconButtonPressed() {
        output.selectedIconButtonPressed()
        CreateHabitViewController.iconView.image = IconPickerViewController.selectedIcon
        
    }
}

extension IconPickerViewController: IconPickerViewInput {
}

// MARK: - UI Setup

extension IconPickerViewController {
    private func setupUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        self.view.backgroundColor = .white
        
        self.view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    private func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 50, left: 40, bottom: 140, right: 40)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 36
        layout.minimumLineSpacing = 36
        layout.itemSize = CGSize(width: 40, height: 40)
        
        return layout
    }
}

// MARK: - UICollectionViewDelegate & Data Source
extension IconPickerViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return icons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! IconPickerCell
        cell.icons = self.icons[indexPath.item]
        cell.tintColor = ColorPickerViewController.habitColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedIconTitle = icons[indexPath.item].title
        IconPickerViewController.iconName = selectedIconTitle
        IconPickerViewController.selectedIcon = UIImage(named: IconPickerViewController.iconName)
        
        if let cell = collectionView.cellForItem(at: indexPath) as? IconPickerCell {
            cell.checkbox.setCheckState(.checked, animated: true)
        }
        
        
            
    }

    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        // Check if the old icon cell is showed. If true, it deselects it
        guard let oldIconCell = collectionView.cellForItem(at: indexPath) as? IconPickerCell else {
            return
        }
        oldIconCell.checkbox.setCheckState(.unchecked, animated: true)
    }
}


