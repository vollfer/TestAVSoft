//
//  Assembly.swift
//  TestAVSoft
//
//  Created by Александр  Бровков  on 22.06.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

protocol Assembly {
    
    static func assembleModule() -> Module
    static func assembleModuleNavigation() -> ModuleNavigation
    static func assembleModule(with model: TransitionModel) -> Module
}

typealias Module = UIViewController
typealias ModuleNavigation = UINavigationController

extension Assembly {
    
    static func assembleModule() -> Module {
        fatalError("implement assembleModule() in ModuleAssembly")
    }
    
    static func assembleModuleNavigation() -> ModuleNavigation {
        fatalError("implement assembleModule() in ModuleAssembly")
    }
    
    static func assembleModule(with model: TransitionModel) -> Module {
        fatalError("implement assembleModule(with model: TransitionModel) in ModuleAssembly")
    }
}
