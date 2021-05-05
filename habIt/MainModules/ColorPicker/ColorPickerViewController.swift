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
    static var rgbColor: [CGFloat] = [0.7, 0.9, 1.0, 1.0]
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
        //        (red: 182/255, green: 230/255, blue: 255/255, alpha: 1)
        saveButton.layer.cornerRadius = 10
        saveButton.setTitleColor(UIColor(red: 48/255, green: 48/255, blue: 48/255, alpha: 1), for: .normal)
        saveButton.addTarget(self, action: #selector(selectedColorButtonPressed), for: .touchUpInside)
        
        
        colorPickerView = ColorPickerView(frame: CGRect(x: 0.0, y: 0.0, width: 230, height: 210))
        
        colorPickerView.colors = [UIColor.red, UIColor.yellow, UIColor.green, UIColor.magenta, UIColor.cyan, UIColor.blue, UIColor.brown, UIColor.orange, UIColor.purple]
        
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
        CreateHabitViewController.colorchangeButton.backgroundColor = ColorPickerViewController.habitColor
        
        print(ColorPickerViewController.rgbColor)
        print(ColorPickerViewController.habitColor)
        
    }
    
    // This is an optional method
    func colorPickerView(_ colorPickerView: ColorPickerView, didDeselectItemAt indexPath: IndexPath) {
        // A color has been deselected
    }
}

extension ColorPickerViewController: ColorPickerViewDelegateFlowLayout {
    
    // ------------------------------------------------------------------
    // All these methods are optionals, your are not to implement them 🖖🏻
    // ------------------------------------------------------------------
    
    //  func colorPickerView(_ colorPickerView: ColorPickerView, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //    // The size for each cell
    //    // 👉🏻 WIDTH AND HEIGHT MUST BE EQUALS!
    //  }
    
    func colorPickerView(_ colorPickerView: ColorPickerView, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // Space between cells
        return 28
    }
    
    func colorPickerView(_ colorPickerView: ColorPickerView, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        // Space between rows
        return 17
    }
    
}
