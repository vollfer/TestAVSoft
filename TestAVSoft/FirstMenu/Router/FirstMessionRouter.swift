//
//  FirstMessionRouter.swift
//  TestAVSoft
//
//  Created by Александр  Бровков  on 22.06.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

protocol FirstMessionRouterInput {
    func openSecondMenu()
}

final class FirstMessionRouter {
    
    //MARK: - Properties
    
    unowned let transition: ModuleTransitionHandler
    
    
    //MARK: - Init
    
    init(transition: ModuleTransitionHandler) {
        self.transition = transition
    }
}

//MARK: - MainMenuRouterInput
extension FirstMessionRouter: FirstMessionRouterInput {
    
    func openSecondMenu() {
        transition.push(moduleType: SecondMenuAssemble.self)
    }
    
}
