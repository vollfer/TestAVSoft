//
//  CastomView.swift
//  TestAVSoft
//
//  Created by Александр  Бровков  on 25.06.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

protocol CustomViewDelegate: NSObject {
    func didTapEditButton(_ customView: UIView)
    func didTapViewButton(_ customView: UIView)
    func didTapAboutApplication(_ customView: UIView)
}

final class CustomView: UIView {
    
    weak var delegate: CustomViewDelegate?
    
    private let stackToolBar: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        drawSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func drawSelf() {
        
        for index in 1...3 {
            let button = UIButton()
            
            button.tag = index
            guard let buttonType = Type(rawValue: index) else {return}
            button.setTitle(buttonType.title, for: .normal)
            button.addTarget(self, action: buttonType.selector, for: .touchUpInside)
            stackToolBar.addArrangedSubview(button)
        }
        
        backgroundColor = .gray
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackToolBar)
        
        
        NSLayoutConstraint.activate([
            stackToolBar.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackToolBar.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackToolBar.rightAnchor.constraint(equalTo: rightAnchor),
            stackToolBar.leftAnchor.constraint(equalTo: leftAnchor)
        ])
    }
    
    @objc func tapEditButton() {
        delegate?.didTapEditButton(self)
    }
    
    @objc func tapViewButton() {
        delegate?.didTapViewButton(self)
    }
    
    @objc func tapApplicationButton() {
        delegate?.didTapAboutApplication(self)
    }
}
