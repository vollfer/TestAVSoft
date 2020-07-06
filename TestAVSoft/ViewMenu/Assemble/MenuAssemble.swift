//
//  MenuAssemble.swift
//  TestAVSoft
//
//  Created by Александр  Бровков  on 29.06.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

final class MenuAssemble: Assembly {
    
    static func assembleModule() -> Module {
        
        let module = MenuViewControler()
        let navigationControler = UINavigationController(rootViewController: module)
        let presenter = MenuPresenter()
        let router = MenuRouter(transition: module)
        let menuTableViewManager = MenuTableViewManager()
        
        module.presenter = presenter
        module.menuTableView = menuTableViewManager
        
        menuTableViewManager.delegate = presenter
        
        presenter.view = module
        presenter.router = router
        
        return navigationControler
    }
}
