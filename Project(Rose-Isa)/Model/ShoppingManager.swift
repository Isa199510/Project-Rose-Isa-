//
//  ShoppingManager.swift
//  Project(Rose-Isa)
//
//  Created by Иса on 04.04.2023.
//

import Foundation

class ShoppingManager {
    
    var shoppings: [ShoppingLists] = getShoppingList()
    static let shared = ShoppingManager()
    
    var sumShoppings: Double {
        shoppings.reduce(0) { $0 + $1.totalPrice}
    }
    
    func addIter(_ n: Double, shoppingIndex: Int, purchaseIndex: Int) {
        shoppings[shoppingIndex].purchases[purchaseIndex].quantity += n
    }
    
    // Method for Shoppings
    func addShopping(shopping: ShoppingLists) {
        shoppings.insert(shopping, at: 0)
    }
    
    func removeShopping(at index: Int) {
        shoppings.remove(at: index)
    }
    
    func removeShopping(shopping: ShoppingLists) {
        guard let index = shoppings.firstIndex(where: {$0.name == shopping.name}) else { return }
        shoppings.remove(at: index)
    }
    
    func renameShopping(name: String, at: Int) {
        shoppings[at].name = name
    }
    
    private init() {}
}


func getShoppingList() -> [ShoppingLists] {
    var shoppingLists = [ShoppingLists]()
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
