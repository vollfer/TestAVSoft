//
//  Person.swift
//  TestAVSoft
//
//  Created by Александр  Бровков  on 05.07.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

struct Person {
    let name: String
    var attribute: String
}

final class PersonsDataSingleton {
    
    static let shared = PersonsDataSingleton()
    
    var persons: [Person] = []
    
    private init() {
        
    }
}
