//
//  FirstMessionAssemble.swift
//  TestAVSoft
//
//  Created by Александр  Бровков  on 22.06.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

final class FirstMessionAssemble: Assembly {
    
    static func assembleModuleNavigation() -> ModuleNavigation {
        
        let module = FirstMessionViewController()
        let presenter = FirstMessionPresenter()
        let router = FirstMessionRouter(transition: module)
        
        module.presenter = presenter
        
        presenter.view = module
        presenter.router = router
        
        
        let navigationController = UINavigationController(rootViewController: module)
        navigationController.setNavigationBarHidden(true, animated: false)
        
        return navigationController
    }
}
