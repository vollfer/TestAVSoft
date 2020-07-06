//
//  SecondMenuPresenter.swift
//  TestAVSoft
//
//  Created by Александр  Бровков  on 24.06.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

protocol SecondMenuInput: class {
    
}

final class SecondMenuPresenter {
    
    weak var view: SecondMenuInput?
    var router: SecondMenuRouterInput?
    
}

//MARK: - SecondMenuViewControllerOutput
extension SecondMenuPresenter: SecondMenuViewControllerOutput {
    func tapApplicationMenu() {
        router?.openApplicationMenu()
    }
    
    func tapViewMenu() {
        router?.openViewMenu()
    }
    
    func tapEditMenu() {
        router?.openEditMenu()
    }
    
    func viewIsReady() {
        
    }
    
}
