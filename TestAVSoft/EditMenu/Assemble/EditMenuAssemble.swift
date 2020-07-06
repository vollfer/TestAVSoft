//
//  EditMenuAssemble.swift
//  TestAVSoft
//
//  Created by Александр  Бровков  on 26.06.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//


final class EditMenuAssemble: Assembly {
    
    struct Model: TransitionModel {
        let person: Person
    }
    
    static func assembleModule(with model: TransitionModel) -> Module {
        
        guard let model = model as? Model  else { fatalError() }
        
        let module = EditMenuViewControler()
        let presenter = EditMenuPresenter(person: model.person)
        let router = EditMenuRouter(transition: module)
        
        module.presenter = presenter
        
        presenter.view = module
        presenter.router = router
        
        return module
    }
    
    static func assembleModule() -> Module {
        
        let module = EditMenuViewControler()
        let presenter = EditMenuPresenter()
        let router = EditMenuRouter(transition: module)
        
        module.presenter = presenter
        
        presenter.view = module
        presenter.router = router
        
        
        return module
    }
}
