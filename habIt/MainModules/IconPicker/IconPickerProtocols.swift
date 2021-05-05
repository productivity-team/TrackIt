//
//  IconPickerProtocols.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 05.05.2021.
//  
//

import Foundation

protocol IconPickerModuleInput {
	var moduleOutput: IconPickerModuleOutput? { get }
}

protocol IconPickerModuleOutput: class {
}

protocol IconPickerViewInput: class {
}

protocol IconPickerViewOutput: class {
    func selectedIconButtonPressed()
}

protocol IconPickerInteractorInput: class {
}

protocol IconPickerInteractorOutput: class {
}

protocol IconPickerRouterInput: class {
    func toCreateHabit()
}
