//
//  MenuPresenter.swift
//  TestAVSoft
//
//  Created by Александр  Бровков  on 29.06.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

protocol MenuPresenterInput: class {
    
}

final class MenuPresenter {
    
    weak var view: MenuPresenterInput?
    var router: MenuRouterInput?
}

//MARK: - ViewMenuViewControlerOutput
extension MenuPresenter: MenuViewControlerOutput {
    func viewIsReady() {
        
    }
    
    
}

extension MenuPresenter: MenuTableViewManagerDelegate {
    func didSelect(person: Person) {
        router?.openEditMenu(person: person)
    }
}
