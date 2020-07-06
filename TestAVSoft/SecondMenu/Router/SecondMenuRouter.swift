//
//  SecondMenuRouter.swift
//  TestAVSoft
//
//  Created by Александр  Бровков  on 24.06.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

protocol SecondMenuRouterInput {
    func openEditMenu()
    func openViewMenu()
    func openApplicationMenu()
}

final class SecondMenuRouter {
    
    //MARK: - Properties
    
    unowned let transition: ModuleTransitionHandler
    
    
    //MARK: - Init
    
    init(transition: ModuleTransitionHandler) {
        self.transition = transition
    }
}

//MARK: - SecondMenuRouterInput
extension SecondMenuRouter: SecondMenuRouterInput {
    func openApplicationMenu() {
        transition.present(animated: true, moduleType: AboutApplicationAssembly.self)
    }
    
    func openViewMenu() {
        transition.present(animated: true, moduleType: MenuAssemble.self)
    }
    
    func openEditMenu() {
        transition.present(animated: true, moduleType: EditMenuAssemble.self)
    }
    
    
    
}
