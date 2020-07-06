//
//  ModuleTransitionHandler.swift
//  TestAVSoft
//
//  Created by Александр  Бровков  on 22.06.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

protocol ModuleTransitionHandler where Self: UIViewController { }

extension ModuleTransitionHandler {
    
    func present<ModuleType: Assembly>(with model: TransitionModel, openModuleType: ModuleType.Type) {
        let view = ModuleType.assembleModule(with: model)
        present(view, animated: true, completion: nil)
    }
    
    func present<ModuleType: Assembly>(animated: Bool, moduleType: ModuleType.Type) {
        let view = ModuleType.assembleModule()
        present(view, animated: animated, completion: nil)
    }
    
    func present(viewController: UIViewController, animated: Bool, completion: (() -> Void)? = nil) {
        present(viewController, animated: animated, completion: completion)
    }
    
    func show<ModuleType: Assembly>(with model: TransitionModel, openModuleType: ModuleType) {
        let view = ModuleType.assembleModule(with: model)
        show(view, sender: nil)
    }
    
    func push<ModuleType: Assembly>(with model: TransitionModel, openModuleType: ModuleType.Type) {
        let view = ModuleType.assembleModule(with: model)
        navigationController?.pushViewController(view, animated: true)
    }
    
    func push<ModuleType: Assembly>(moduleType: ModuleType.Type) {
        let view = ModuleType.assembleModule()
        navigationController?.pushViewController(view, animated: true)
    }
    
    func pushFromContainer<ModuleType: Assembly>(with model: TransitionModel, moduleType: ModuleType.Type) {
        let view = ModuleType.assembleModule(with: model)
        navigationController?.pushViewController(view, animated: true)
    }
    
    func closeModule() {
     
        guard presentingViewController != nil else {
            navigationController?.popViewController(animated: true)
            return
        }
        dismiss(animated: true, completion: nil)
    }
    
    func dismiss(animated: Bool, completion: ( () -> Void)?) {
        dismiss(animated: animated, completion: completion)
    }
    
}

protocol TransitionModel { }

extension UIViewController : ModuleTransitionHandler { }
