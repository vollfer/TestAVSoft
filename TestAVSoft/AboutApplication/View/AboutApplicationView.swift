//
//  AboutApplicationView.swift
//  TestAVSoft
//
//  Created by Александр  Бровков  on 06.07.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

protocol ApplicationViewOutput: ViewOutput {
    
}

final class AboutApplicationView: UIViewController {
    
    //MARK: - Properties
    
    var presenter: ApplicationViewOutput?
    
    private let applicationLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "Тестовое задание для AVSoft"
        
        return label
    }()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawSelf()
    }
    
    func drawSelf() {
        
        view.backgroundColor = .white
        
        view.addSubview(applicationLable)
        
        NSLayoutConstraint.activate([
            applicationLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            applicationLable.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

//MARK: - ApplicationViewInput
extension AboutApplicationView: ApplicationViewInput {
    
}

