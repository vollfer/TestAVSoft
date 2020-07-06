//
//  Module.swift
//  TestAVSoft
//
//  Created by Александр  Бровков  on 25.06.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

enum Type: Int {
    case one = 1
    case two = 2
    case three = 3
    
    var title: String {
        switch self {
        case .one:
            return "Реактировать"
        case .two:
            return "Просмотр"
        case .three:
            return "О программе"
        }
    }
    var selector: Selector {
        switch self {
        case .one:
            return #selector(CustomView.tapEditButton)
        case .two:
            return #selector(CustomView.tapViewButton)
        case .three:
            return #selector(CustomView.tapApplicationButton)
        }
    }
}
