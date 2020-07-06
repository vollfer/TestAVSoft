//
//  FirstMessionViewController.swift
//  TestAVSoft
//
//  Created by Александр  Бровков  on 22.06.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

protocol FirstMessionViewControllerOutput: ViewOutput {
    func secondMenu()
}

final class FirstMessionViewController: UIViewController {
    
    //MARK: - Properties
    
    var presenter: FirstMessionViewControllerOutput?
    
    private var titleText: UILabel = {
        let label = UILabel()
        label.text = "Введит свой логин и пароль"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .bold)
        
        return label
    }()
    
    private var login: UITextField = {
        let login = UITextField()
        login.placeholder = "Логин"
        login.layer.borderWidth = 1
        login.layer.cornerRadius = 4
        login.autocapitalizationType = .none
        login.backgroundColor = .white
        login.translatesAutoresizingMaskIntoConstraints = false
        
        return login
    }()
    
    private var password: UITextField = {
        let password = UITextField()
        password.placeholder = "Пароль"
        password.layer.borderWidth = 1
        password.layer.cornerRadius = 4
        password.autocapitalizationType = .none
        password.backgroundColor = .white
        password.isSecureTextEntry = true
        password.translatesAutoresizingMaskIntoConstraints = false
        
        return password
    }()
    
    private var entryButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.blue, for: .normal)
        button.setTitle("Вход", for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        
        return button
    }()
    
    private var progressView: UIProgressView = {
        let progress = UIProgressView()
        progress.layer.borderWidth = 1
        progress.layer.cornerRadius = 4
        progress.setProgress(0.0, animated: true)
        progress.trackTintColor = .white
        progress.isHidden = true
        progress.translatesAutoresizingMaskIntoConstraints = false
        
        return progress
    }()
    
    //MARK: - Life cycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawSelf()
    }
    
    private func drawSelf() {
        
        view.backgroundColor = .blue
        
        view.addSubview(titleText)
        view.addSubview(login)
        view.addSubview(password)
        view.addSubview(entryButton)
        view.addSubview(progressView)
        
        
        NSLayoutConstraint.activate([
            
            login.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            login.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            login.widthAnchor.constraint(equalToConstant: 300),
            login.heightAnchor.constraint(equalToConstant: 30),
            
            titleText.bottomAnchor.constraint(equalTo: login.topAnchor, constant: -50),
            titleText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            password.topAnchor.constraint(equalTo: login.bottomAnchor, constant: 10),
            password.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            password.widthAnchor.constraint(equalToConstant: 300),
            password.heightAnchor.constraint(equalToConstant: 30),
            
            entryButton.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 10),
            entryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            entryButton.widthAnchor.constraint(equalToConstant: 90),
            entryButton.heightAnchor.constraint(equalToConstant: 30),
            
            progressView.topAnchor.constraint(equalTo: entryButton.bottomAnchor, constant: 10),
            progressView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressView.widthAnchor.constraint(equalToConstant: 150),
            progressView.heightAnchor.constraint(equalToConstant: 5)
        ])
        
        entryButton.addTarget(self, action: #selector(didTapEntryButton), for: .touchUpInside)
        
    }
    
    @objc private func didTapEntryButton() {
        guard password.text == passwordAccount && login.text == loginAccount else { return showAlert() }
        progressView.isHidden = false
        entryButton.isEnabled = false
        let timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(editProgressView(timer:)), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: .common)
    }
    
    @objc private func editProgressView(timer: Timer) {
        if progressView.progress != 1 {
            let progress = progressView.progress
            progressView.setProgress(progress + 0.1, animated: true)
        } else {
            timer.invalidate()
            presenter?.secondMenu()
        }
    }
    
    private func showAlert() {
        let alert  = UIAlertController(title: "Ошибка", message: "Неверный логин или пароль", preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(actionOK)
        present(alert, animated: true)
    }
}

//MARK: - FirstMessionInput
extension FirstMessionViewController: FirstMessionInput {
    
}
