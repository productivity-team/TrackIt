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
    private let upperLabel = UILabel()
    private let saveButton = UIButton()

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
        
        upperLabel.text = "Выберите цвет"
        upperLabel.font = UIFont(name: "Lato-Bold", size: 20)
        
        saveButton.setTitle("Сохранить", for: .normal)
        saveButton.titleLabel?.font = UIFont(name: "Lato-Medium", size: 20)
        saveButton.backgroundColor = UIColor(red: 182/255, green: 230/255, blue: 255/255, alpha: 1)
        saveButton.layer.cornerRadius = 10
        saveButton.setTitleColor(UIColor(red: 48/255, green: 48/255, blue: 48/255, alpha: 1), for: .normal)
        
        colorPickerView = ColorPickerView(frame: CGRect(x: 0.0, y: 0.0, width: 280, height: 500))
        
        [upperLabel, saveButton, colorPickerView].forEach {view.addSubview($0)}
        
        colorPickerView.delegate = self
        colorPickerView.layoutDelegate = self
        
	}
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
        
        upperLabel.pin
            .top(33)
            .sizeToFit()
            .hCenter()
        
        saveButton.pin
            .height(50)
            .width(160)
            .bottom(74)
            .hCenter()
            
        
        colorPickerView.pin
            .below(of: upperLabel).margin(70)
            .hCenter()
            .vCenter()
        
    }
    
}

extension ColorPickerViewController: ColorPickerViewInput {
}

extension ColorPickerViewController: ColorPickerViewDelegate {

  func colorPickerView(_ colorPickerView: ColorPickerView, didSelectItemAt indexPath: IndexPath) {
    // A color has been selected
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
    return 20
  }

  func colorPickerView(_ colorPickerView: ColorPickerView, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    // Space between rows
    return 10
  }

//  func colorPickerView(_ colorPickerView: ColorPickerView, insetForSectionAt section: Int) -> UIEdgeInsets {
//    // Inset used aroud the view
//  }

}
