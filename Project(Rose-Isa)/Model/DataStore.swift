//
//  DataStore.swift
//  Project(Rose-Isa)
//
//  Created by Иса on 04.02.2023.
//

import Foundation

class ShoppingManager {
    var shoppings: [ShoppingLists] = getShoppingList()
    static let shared = ShoppingManager()
    
    func addIter(_ n: Double, shoppingIndex: Int, purchaseIndex: Int) {
        shoppings[shoppingIndex].purchases[purchaseIndex].quantity += n
    }
    
}

var shoppingLists = [ShoppingLists]()

func getShoppingList() -> [ShoppingLists] {
    let purchaseOne = Purchase(name: "хлеб", quantity: 2, price: 25)
    let purchaseTwo = Purchase(name: "молоко", quantity: 1, price: 100)
    var shoppingOne = ShoppingLists("супермаркет")
    shoppingOne.purchases = [purchaseOne, purchaseTwo]
    shoppingLists.append(shoppingOne)
    
    let purchaseThree = Purchase(name: "огурцы", quantity: 2, price: 150)
    let purchaseFour = Purchase(name: "помидоры", quantity: 1, price: 200)
    let purchaseFive = Purchase(name: "помидоры", quantity: 1, price: 200)
    var shoppingTwo = ShoppingLists("рынок")
    shoppingTwo.purchases = [purchaseThree, purchaseFour, purchaseFive]
    shoppingLists.append(shoppingTwo)

    shoppingLists.append(ShoppingLists("Запчасти"))
    
    return shoppingLists
}


struct Person {
    let name: String
    let age: Int
    let info: String
    
    static func getPersons() -> [Person] {
        var persons: [Person] = [Person]()
        persons.insert(
            contentsOf: [
                Person(name: "Isa", age: 27, info: ""),
                Person(name: "Rose", age: 35, info: "")
            ],
            at: 0)
        return persons
    }
}

var shoppings = getShoppingList()
