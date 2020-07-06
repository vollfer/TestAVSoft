//
//  EditMenuPresenter.swift
//  TestAVSoft
//
//  Created by Александр  Бровков  on 26.06.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

protocol EditMenuPresenterInput: class {
    func updateViewIfNeeded(with person: Person?)
    func showAlertOnExistPeron(subtitle: String, buttonTitle: String)
    func showAlertOnNoSuchperson(subtitle: String, buttonTitle: String)
}

final class EditMenuPresenter {
    
    weak var view: EditMenuPresenterInput?
    var router: EditMenuRouterInput?
    private let person: Person?
    private var personsDataSingleton = PersonsDataSingleton.shared
    private let fileURLProject = Bundle.main.path(forResource: "Persons", ofType: "txt")
    
    init(person: Person? = nil) {
        self.person = person
    }
    
    func addPersonInFile() {
        var data: String = ""
        
        for persone in personsDataSingleton.persons {
            data += "\(persone)\n"
        }
        do {
            try data.write(toFile: fileURLProject!, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Failed to write to URL")
            print(error)
        }
        
        var readString = ""
        do {
            readString = try String(contentsOfFile: fileURLProject!, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Failed to read frome project")
            print(error)
        }
        print(readString)
    }
}

//MARK: - EditMenuViewControlerOutput
extension EditMenuPresenter: EditMenuViewControlerOutput {
    func didTapEditPersone(name: String, attribute: String) {
        var index = 0
        var bool = false
        
        for person in PersonsDataSingleton.shared.persons {
            if person.name == name {
                bool = true
                personsDataSingleton.persons[index] = Person(name: name, attribute: attribute)
            }
            index += 1
        }
        if bool == false {
            view?.showAlertOnNoSuchperson(subtitle: "Такой Человек не найден", buttonTitle: "OK")
        }
        addPersonInFile()
    }
    
    func didTapDeletePerson(name: String) {
        var index = 0
        for person in personsDataSingleton.persons {
            index += 1
            if person.name == name {
                personsDataSingleton.persons.remove(at: index - 1)
            }
        }
        addPersonInFile()
    }
    
    
    func didTadAddPerson(name: String, attribute: String) {
        for person in personsDataSingleton.persons {
            if person.name == name {
                view?.showAlertOnExistPeron(subtitle: "Человек уже добавлен", buttonTitle: "OK")
                return
            }
        }
        personsDataSingleton.persons.append(Person(name: name, attribute: attribute))
        addPersonInFile()
    }
    
    func viewIsReady() {
        view?.updateViewIfNeeded(with: person)
    }
}


