//
//  EditMenuRouter.swift
//  TestAVSoft
//
//  Created by Александр  Бровков  on 26.06.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

protocol EditMenuRouterInput {
    
}

final class EditMenuRouter {
    
    //MARK: - Properties
    
    unowned let transition: ModuleTransitionHandler
    
    
    //MARK: - Init
    
    init(transition: ModuleTransitionHandler) {
        self.transition = transition
    }
}

//MARK: - EditMenuRouterInput
extension EditMenuRouter: EditMenuRouterInput {
    
}
