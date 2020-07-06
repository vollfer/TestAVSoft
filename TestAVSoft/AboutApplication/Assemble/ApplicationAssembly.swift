//
//  ApplicationAssembly.swift
//  TestAVSoft
//
//  Created by Александр  Бровков  on 06.07.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

final class AboutApplicationAssembly: Assembly {
    
    static func assembleModule() -> Module {
        
        let module = AboutApplicationView()
        let presenter = AboutApplicationPresenter()
        let router = AboutApplicationRouter(transition: module)
        
        module.presenter = presenter
        
        presenter.view = module
        presenter.router = router
        
        return module
    }
}
