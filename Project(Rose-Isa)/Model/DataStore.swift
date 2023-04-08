//
//  DataStore.swift
//  Project(Rose-Isa)
//
//  Created by Иса on 04.02.2023.
//

import Foundation

struct Person {
    let name: String
    let city: String
    
    static func getPersons() -> [Person] {
        var persons: [Person] = [Person]()
        persons.insert(
            contentsOf: [
                Person(name: "Иса Арбухов", city: "Москва"),
                Person(name: "Роза Халдеева", city: "Алматы")
            ],
            at: 0)
        return persons
    }
}

var shoppingManager = ShoppingManager.shared
