//
//  SecondMenuAssemble.swift
//  TestAVSoft
//
//  Created by Александр  Бровков  on 24.06.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

final class SecondMenuAssemble: Assembly {
    
    static func assembleModule() -> Module {
        
        let module = SecondMenuViewController()
        let presenter = SecondMenuPresenter()
        let router = SecondMenuRouter(transition: module)
        
        module.presenter = presenter
        
        presenter.view = module
        presenter.router = router
        
        return module
    }
}
