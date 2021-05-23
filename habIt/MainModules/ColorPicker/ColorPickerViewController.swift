//
//  ColorPickerViewController.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 25.04.2021.
//  
//

import UIKit
import IGColorPicker
import EzPopup

final class ColorPickerViewController: UIViewController {
    private let output: ColorPickerViewOutput
    
    private var colorPickerView: ColorPickerView!
    private let saveButton = UIButton()
    static var rgbColor: [CGFloat] = [254/255, 194/255, 76/255, 1.0]
    static var habitColor = UIColor(red: rgbColor[0], green: rgbColor[1], blue: rgbColor[2], alpha: rgbColor[3])
    
    init(output: ColorPickerViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 249/255, green: 255/255, blue: 255/255, alpha: 1)
        
        saveButton.setTitle("Выбрать", for: .normal)
        saveButton.titleLabel?.font = UIFont(name: "Lato-Medium", size: 20)
        saveButton.backgroundColor = ColorPickerViewController.habitColor
        saveButton.layer.cornerRadius = 10
        saveButton.setTitleColor(UIColor(red: 48/255, green: 48/255, blue: 48/255, alpha: 1), for: .normal)
        saveButton.addTarget(self, action: #selector(selectedColorButtonPressed), for: .touchUpInside)
        
        
        colorPickerView = ColorPickerView(frame: CGRect(x: 0.0, y: 0.0, width: 230, height: 210))
        
        colorPickerView.colors = [UIColor(red: 244/255, green: 54/255, blue: 54/255, alpha: 1),
                                  UIColor(red: 238/255, green: 117/255, blue: 117/255, alpha: 1),
                                  UIColor(red: 254/255, green: 194/255, blue: 76/255, alpha: 1),
                                  UIColor(red: 107/255, green: 220/255, blue: 227/255, alpha: 1),
                                  UIColor(red: 0/255, green: 230/255, blue: 190/255, alpha: 1),
                                  UIColor(red: 70/255, green: 206/255, blue: 75/255, alpha: 1),
                                  UIColor(red: 85/255, green: 158/255, blue: 225/255, alpha: 1),
                                  UIColor(red: 232/255, green: 124/255, blue: 221/255, alpha: 1),
                                  UIColor(red: 183/255, green: 92/255, blue: 255/255, alpha: 1)]
        
        [saveButton, colorPickerView].forEach {view.addSubview($0)}
        
        colorPickerView.delegate = self
        colorPickerView.layoutDelegate = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        saveButton.pin
            .height(50)
            .width(160)
            .bottom(40)
            .hCenter()
        
        colorPickerView.pin
            .above(of: saveButton).margin(50)
            .hCenter()
            .vCenter()
    }
    
    @objc
    private func selectedColorButtonPressed() {
        output.selectedColorButtonPressed()
        CreateHabitViewController.colorcircleView.backgroundColor = ColorPickerViewController.habitColor
        CreateHabitViewController.iconView.tintColor = ColorPickerViewController.habitColor
    }
    
}

extension ColorPickerViewController: ColorPickerViewInput {
}

extension ColorPickerViewController: ColorPickerViewDelegate {
    
    func colorPickerView(_ colorPickerView: ColorPickerView, didSelectItemAt indexPath: IndexPath) {
        // A color has been selected
        
        ColorPickerViewController.rgbColor = colorPickerView.colors[indexPath.item].cgColor.components!
        ColorPickerViewController.habitColor = UIColor(red: ColorPickerViewController.rgbColor[0], green: ColorPickerViewController.rgbColor[1], blue: ColorPickerViewController.rgbColor[2], alpha: ColorPickerViewController.rgbColor[3])
        saveButton.backgroundColor = ColorPickerViewController.habitColor
        
    }
    
    // This is an optional method
    func colorPickerView(_ colorPickerView: ColorPickerView, didDeselectItemAt indexPath: IndexPath) {
        // A color has been deselected
    }
}

extension ColorPickerViewController: ColorPickerViewDelegateFlowLayout {
    
    func colorPickerView(_ colorPickerView: ColorPickerView, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // Space between cells
        return 28
    }
    
    func colorPickerView(_ colorPickerView: ColorPickerView, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        // Space between rows
        return 17
    }
    
}
