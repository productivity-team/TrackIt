//
//  SettingsProtocols.swift
//  tabbar
//
//  Created by kjhfsjdgfhk on 10.04.2021.
//  
//

import Foundation

protocol SettingsModuleInput {
	var moduleOutput: SettingsModuleOutput? { get }
}

protocol SettingsModuleOutput: class {
}

protocol SettingsViewInput: class {
}

protocol SettingsViewOutput: class {
    func logOutButtonPressed()
}

protocol SettingsInteractorInput: class {
}

protocol SettingsInteractorOutput: class {
}

protocol SettingsRouterInput: class {
    func logOut()
}
