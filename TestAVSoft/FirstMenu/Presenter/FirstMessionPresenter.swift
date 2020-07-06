//
//  FirstMessionPresenter.swift
//  TestAVSoft
//
//  Created by Александр  Бровков  on 22.06.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

let loginAccount = "qwer"
let passwordAccount = "1234"

protocol FirstMessionInput: class {
    
    
}

final class FirstMessionPresenter {
    
    weak var view: FirstMessionInput?
    var router: FirstMessionRouterInput?
    
    
}

//MARK: - FirstMessionViewControllerOutput
extension FirstMessionPresenter: FirstMessionViewControllerOutput {
    
    func secondMenu() {
        router?.openSecondMenu()
    }
    
    func viewIsReady() {
        
    }
}
