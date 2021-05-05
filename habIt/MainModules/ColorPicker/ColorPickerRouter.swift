//
//  ColorPickerRouter.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 25.04.2021.
//  
//

import UIKit
import EzPopup

final class ColorPickerRouter {
    weak var sourceViewController: UIViewController?
}

extension ColorPickerRouter: ColorPickerRouterInput {
    
    //открыть экран создания привычки
    func toCreateHabit() {
        let container = ColorPickerContainer.assemble(with: ColorPickerContext())
        let viewController = container.viewController
        
        let popupVC = PopupViewController(contentController: viewController, popupWidth: 300, popupHeight: 400)
        popupVC.cornerRadius = 20
        sourceViewController?.dismiss(animated: true, completion: nil)
    }
}
