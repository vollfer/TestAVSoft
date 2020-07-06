//
//  MenuViewControler.swift
//  TestAVSoft
//
//  Created by Александр  Бровков  on 29.06.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

protocol  MenuViewControlerOutput: ViewOutput {
    
}

final class MenuViewControler: UIViewController {
    var presenter: MenuViewControlerOutput?
    var menuTableView: MenuTableViewInput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        drawSelf()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        menuTableView?.reloadData()
    }
    
    private func drawSelf() {
        view.backgroundColor = .white
        
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
        menuTableView?.setup(tableView: tableView)
    }
}

//MARK: - ViewMenuPresenterInput
extension MenuViewControler: MenuPresenterInput {
    
}
