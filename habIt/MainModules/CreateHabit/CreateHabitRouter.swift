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
    
    //переход к выбору иконки
    func toIconPicker() {
        let container = IconPickerContainer.assemble(with: IconPickerContext())
        let viewController = container.viewController
        
        let popupVC = PopupViewController(contentController: viewController, popupWidth: 348, popupHeight: 534)
        popupVC.cornerRadius = 20
        sourceViewController?.present(popupVC, animated: true, completion: nil)
    }
    
    //переход к выбору цвета
    func toColorPicker() {
        let container = ColorPickerContainer.assemble(with: ColorPickerContext())
        let viewController = container.viewController
        
        let popupVC = PopupViewController(contentController: viewController, popupWidth: 300, popupHeight: 400)
        popupVC.cornerRadius = 20
        sourceViewController?.present(popupVC, animated: true, completion: nil)
    }
    
    //функция с поп-апом:
    func showAlert() {
        let alert = UIAlertController(title: "Ошибка", message: "Пожалуйста, заполните все поля.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        sourceViewController?.present(alert, animated: true, completion: nil)
    }
    
    //возвращение в меню
    func closeHabitCreation() {
        let container = TabBarContainer.assemble(with: TabBarContext())
        let viewController = container.viewController
        viewController.modalPresentationStyle = .fullScreen
        sourceViewController?.dismiss(animated: true, completion: nil)
    }
    
}
