//
//  MenuRouter.swift
//  TestAVSoft
//
//  Created by Александр  Бровков  on 29.06.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

protocol MenuRouterInput {
    func openEditMenu(person: Person)
}

final class MenuRouter {
    
    //MARK: - Properties
    
    unowned let transition: ModuleTransitionHandler
    
    
    //MARK: - Init
    
    init(transition: ModuleTransitionHandler) {
        self.transition = transition
    }
}

//MARK: - ViewMenuRouterInput
extension MenuRouter: MenuRouterInput {
    
    func openEditMenu(person: Person) {
        let model = EditMenuAssemble.Model(person: person)
        transition.push(with: model, openModuleType: EditMenuAssemble.self)
    }
}
