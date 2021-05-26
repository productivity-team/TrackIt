//
//  HabitRouter.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 22.04.2021.
//  
//

import UIKit

final class HabitRouter {
    weak var sourceViewController: UIViewController?
}

extension HabitRouter: HabitRouterInput {
    
    
    func showAlert() {
        let alert = UIAlertController(title: "Ошибка", message: "Пожалуйста, впишите ваш прогресс", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        sourceViewController?.present(alert, animated: true, completion: nil)
    }
    
    //алерт сброса прогресса привычки
    func resetAlert() -> Bool {
        var resetConfirmed: Bool = false
        let alert = UIAlertController(title: "Сбросить прогресс?", message: "Вы уверены, что хотите сбросить весь прогресс за сегодня?", preferredStyle: .alert)
        let tappedHabitName = HabitViewController.tappedHabitName
        let updateKey = String(diffInDays)
        alert.addAction(UIAlertAction(title: "Да", style: .destructive, handler: { action in
            
            FirebaseHandler.shared.resetProgress(tappedHabitName: tappedHabitName, updateKey: updateKey)
            resetConfirmed = true
            
        
            let viewController = TabBarContainer.assemble(with: TabBarContext()).viewController
            viewController.modalPresentationStyle = .fullScreen
            self.sourceViewController?.present(viewController, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Нет", style: .cancel, handler: nil))
        sourceViewController?.present(alert, animated: true, completion: nil)
        resetConfirmed = false
        return resetConfirmed
    }
    
    //переход на главный экран
    func openMenu() {
        let container = TabBarContainer.assemble(with: TabBarContext())
        let viewController = container.viewController
        viewController.modalPresentationStyle = .fullScreen
        sourceViewController?.present(viewController, animated: true, completion: nil)
    }
   
    
    
}
