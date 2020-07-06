//
//  AboutApplicationPresenter.swift
//  TestAVSoft
//
//  Created by Александр  Бровков  on 06.07.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import Foundation

protocol ApplicationViewInput: class {
    
}

final class AboutApplicationPresenter {
    
    // MARK: - Properties
    
    weak var view: ApplicationViewInput?
    var router: ApplicationRouterInput?
    
}

//MARK: - ApplicationViewOutput
extension AboutApplicationPresenter: ApplicationViewOutput {
    func viewIsReady() {
        
    }
}
