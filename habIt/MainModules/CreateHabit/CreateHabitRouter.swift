//
//  CreateHabitRouter.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 22.04.2021.
//  
//

import UIKit
import EzPopup

final class CreateHabitRouter {
    weak var sourceViewController: UIViewController?
}

extension CreateHabitRouter: CreateHabitRouterInput {
    
    func toColorPicker() {
        let container = ColorPickerContainer.assemble(with: ColorPickerContext())
        let viewController = container.viewController
        
        let popupVC = PopupViewController(contentController: viewController, popupWidth: 300, popupHeight: 400)
        popupVC.cornerRadius = 20
        sourceViewController?.present(popupVC, animated: true, completion: nil)
    }
    
}
