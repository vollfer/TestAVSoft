//
//  AboutApplicationRouter.swift
//  TestAVSoft
//
//  Created by Александр  Бровков  on 06.07.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

protocol ApplicationRouterInput {
    
}

final class AboutApplicationRouter {
    
    //MARK: - Properties
    
    unowned let transition: ModuleTransitionHandler
    
    //MARK: - Init
    
    init(transition: ModuleTransitionHandler) {
        self.transition = transition
    }
}

//MARK: - ApplicationRouterInput
extension AboutApplicationRouter: ApplicationRouterInput {
    
}
