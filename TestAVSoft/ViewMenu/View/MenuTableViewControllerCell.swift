//
//  MenuTableViewControllerCell.swift
//  TestAVSoft
//
//  Created by Александр  Бровков  on 29.06.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

final class MenuTableViewControllerCell: UITableViewCell {
    
    private let nameText: UILabel = {
        let nameText = UILabel()
        nameText.translatesAutoresizingMaskIntoConstraints = false
        
        return nameText
    }()
    
    private let attributeText: UILabel = {
        let attributeText = UILabel()
        attributeText.translatesAutoresizingMaskIntoConstraints = false
        attributeText.numberOfLines = 0
        
        return attributeText
    }()
    
    private let nameTitle: UILabel = {
        let nameTitle = UILabel()
        nameTitle.translatesAutoresizingMaskIntoConstraints = false
        nameTitle.text = "Ф.И.О"
        nameTitle.font = .systemFont(ofSize: 14, weight: .bold)
        
        return nameTitle
    }()
    
    private let attributeTitle: UILabel = {
        let attributeTitle = UILabel()
        attributeTitle.translatesAutoresizingMaskIntoConstraints = false
        attributeTitle.text = "Данные о человеке"
        attributeTitle.font = .systemFont(ofSize: 14, weight: .bold)
        
        return attributeTitle
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        drawSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func drawSelf() {
        
        contentView.addSubview(nameText)
        contentView.addSubview(attributeText)
        contentView.addSubview(nameTitle)
        contentView.addSubview(attributeTitle)
        
        NSLayoutConstraint.activate([
            
            nameTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            nameTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            nameTitle.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            
            nameText.topAnchor.constraint(equalTo: nameTitle.bottomAnchor, constant: 10),
            nameText.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            nameText.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            
            attributeTitle.topAnchor.constraint(equalTo: nameText.bottomAnchor, constant: 10),
            attributeTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            attributeTitle.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            
            attributeText.topAnchor.constraint(equalTo: attributeTitle.bottomAnchor, constant: 10),
            attributeText.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            attributeText.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            attributeText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
    
    func setup(name: String, attribute: String) {
        attributeText.text = attribute
        nameText.text = name
    }
}
