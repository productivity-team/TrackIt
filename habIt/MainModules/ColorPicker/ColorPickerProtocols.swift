//
//  ColorPickerProtocols.swift
//  habIt
//
//  Created by Maria Pecheritsyna on 25.04.2021.
//  
//

import Foundation

protocol ColorPickerModuleInput {
	var moduleOutput: ColorPickerModuleOutput? { get }
}

protocol ColorPickerModuleOutput: class {
}

protocol ColorPickerViewInput: class {
}

protocol ColorPickerViewOutput: class {
}

protocol ColorPickerInteractorInput: class {
}

protocol ColorPickerInteractorOutput: class {
}

protocol ColorPickerRouterInput: class {
}
