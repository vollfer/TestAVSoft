//
//  EditMenuViewControler.swift
//  TestAVSoft
//
//  Created by Александр  Бровков  on 26.06.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

protocol EditMenuViewControlerOutput: ViewOutput {
    func didTadAddPerson(name: String, attribute: String)
    func didTapDeletePerson(name: String)
    func didTapEditPersone(name: String, attribute: String)
}

final class EditMenuViewControler: UIViewController {
    
    //MARK: - Properties
    var presenter: EditMenuViewControlerOutput?
    
    private let addPerson: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "add"), for: .normal)
        button.addTarget(self, action: #selector(didTadAddPerson), for: .touchUpInside)
        
        return button
    }()
    
    private let edit: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "edit"), for: .normal)
        button.addTarget(self, action: #selector(didTapEditPersone), for: .touchUpInside)
        
        return button
    }()
    
    private let delete: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "delete"), for: .normal)
        button.addTarget(self, action: #selector(didTapDeletePerson), for: .touchUpInside)
        
        return  button
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Ф.И.О"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let attributeLabel: UILabel = {
        let label = UILabel()
        label.text = "Данные о человеке"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let nameText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.layer.borderWidth = 1
        text.layer.cornerRadius = 4
        text.autocapitalizationType = .none
        text.backgroundColor = .white
        
        return text
    }()
    
    private let attributeText: UITextView = {
        let attribute = UITextView()
        attribute.translatesAutoresizingMaskIntoConstraints = false
        attribute.layer.borderWidth = 1
        attribute.layer.cornerRadius = 4
        attribute.autocapitalizationType = .none
        attribute.backgroundColor = .white
        attribute.font = UIFont.systemFont(ofSize: 18)
        
        return attribute
    }()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        drawSelf()
        presenter?.viewIsReady()
    }
    
    private func drawSelf() {
        view.backgroundColor = .white
        
        view.addSubview(addPerson)
        view.addSubview(edit)
        view.addSubview(delete)
        view.addSubview(nameText)
        view.addSubview(attributeText)
        view.addSubview(nameLabel)
        view.addSubview(attributeLabel)
        
        
        NSLayoutConstraint.activate([
            addPerson.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
            addPerson.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            edit.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            edit.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            
            delete.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            delete.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: nameText.topAnchor, constant: -4),
            
            nameText.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            nameText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameText.widthAnchor.constraint(equalToConstant: 320),
            nameText.heightAnchor.constraint(equalToConstant: 30),
            
            attributeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            attributeLabel.bottomAnchor.constraint(equalTo: attributeText.topAnchor, constant: -4),
            
            attributeText.topAnchor.constraint(equalTo: nameText.bottomAnchor, constant: 25),
            attributeText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            attributeText.widthAnchor.constraint(equalToConstant: 320),
            attributeText.heightAnchor.constraint(equalToConstant: 200),
            
        ])
    }
    
    @objc private func didTadAddPerson() {
        guard let name = nameText.text,
            let attribute = attributeText.text,
            !name.isEmpty,
            !attribute.isEmpty else { return showAlertOnAllCase() }
        presenter?.didTadAddPerson(name: name, attribute: attribute)
    }
    
    @objc private func didTapDeletePerson() {
        guard let name = nameText.text,
            !name.isEmpty else { return showAlertOnName() }
        presenter?.didTapDeletePerson(name: name)
        nameText.text = ""
        attributeText.text = ""
    }
    
    @objc private func didTapEditPersone() {
        guard let name = nameText.text,
            let attribute = attributeText.text,
            !attribute.isEmpty,
            !name.isEmpty else { return showAlertOnAllCase() }
        presenter?.didTapEditPersone(name: name, attribute: attribute)
    }
    
    private func showAlertOnAllCase() {
        let alert = UIAlertController(title: nil, message: "Заполните все поля", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
    
    private func showAlertOnName() {
        let alert = UIAlertController(title: nil, message: "Заполните имя", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
}

//MARK: - EditMenuPresenterInput
extension EditMenuViewControler: EditMenuPresenterInput {
    func showAlertOnNoSuchperson(subtitle: String, buttonTitle: String) {
        let alert = UIAlertController(title: nil, message: subtitle, preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
    
    func showAlertOnExistPeron(subtitle: String, buttonTitle: String) {
        let alert = UIAlertController(title: nil, message: subtitle, preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: buttonTitle, style: .cancel, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
    
    func updateViewIfNeeded(with person: Person?) {
        nameText.text = person?.name
        attributeText.text = person?.attribute
    }
}
