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
    static var chosenColor: [CGFloat] = [0.7, 0.9, 1.0, 1.0]
    static var profileColor = UIColor(red: chosenColor[0], green: chosenColor[1], blue: chosenColor[2], alpha: chosenColor[3])
    

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
        saveButton.backgroundColor = ColorPickerViewController.profileColor
//        (red: 182/255, green: 230/255, blue: 255/255, alpha: 1)
        saveButton.layer.cornerRadius = 10
        saveButton.setTitleColor(UIColor(red: 48/255, green: 48/255, blue: 48/255, alpha: 1), for: .normal)
        
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
    
}

extension ColorPickerViewController: ColorPickerViewInput {
}

extension ColorPickerViewController: ColorPickerViewDelegate {

  func colorPickerView(_ colorPickerView: ColorPickerView, didSelectItemAt indexPath: IndexPath) {
    // A color has been selected
    
    ColorPickerViewController.chosenColor = colorPickerView.colors[indexPath.item].cgColor.components!
    ColorPickerViewController.profileColor = UIColor(red: ColorPickerViewController.chosenColor[0], green: ColorPickerViewController.chosenColor[1], blue: ColorPickerViewController.chosenColor[2], alpha: ColorPickerViewController.chosenColor[3])
    saveButton.backgroundColor = ColorPickerViewController.profileColor

    print(ColorPickerViewController.chosenColor)
    print(ColorPickerViewController.profileColor)

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

//  func colorPickerView(_ colorPickerView: ColorPickerView, insetForSectionAt section: Int) -> UIEdgeInsets {
//    // Inset used aroud the view
//  }

}
