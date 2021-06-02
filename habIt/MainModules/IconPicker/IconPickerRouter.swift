//
//  IconPickerRouter.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 05.05.2021.
//  
//

import UIKit
import EzPopup

final class IconPickerRouter {
    weak var sourceViewController: UIViewController?
}

extension IconPickerRouter: IconPickerRouterInput {
    
    //открыть экран создания привычки
    func toCreateHabit() {
        let container = IconPickerContainer.assemble(with: IconPickerContext())
        let viewController = container.viewController
        
        let popupVC = PopupViewController(contentController: viewController, popupWidth: 300, popupHeight: 400)
        popupVC.cornerRadius = 20
        sourceViewController?.dismiss(animated: true, completion: nil)
    }
}
