//
//  Model.swift
//  Project(Rose-Isa)
//
//  Created by Иса on 04.02.2023.
//

import Foundation

struct Purchase {
    var name: String
    var price: Double
    var quantity: Double
    var isChecked: Bool
    
    var amount: Double {
        quantity * price
    }
    
    init() {
        name = ""
        quantity = 0.0
        price = 0.0
        isChecked = false
    }
    init(name: String, quantity: Double, price: Double) {
        self.name = name
        self.quantity = quantity
        self.price =  price
        self.isChecked = false
    }
}

struct ShoppingLists {
    var name: String
    var purchases: [Purchase]
    var isChecked: Bool 
    
    var totalPrice: Double {
        var amount = 0.0
        for purchase in purchases {
            amount += purchase.amount
        }
        return amount
    }
    
    init(_ name: String) {
        self.name = name
        self.purchases = [Purchase]()
        self.isChecked = false
    }
    
    mutating func setPurchase(_ purchase: Purchase, index: Int?) {
        if let index = index {
            self.purchases[index] = purchase
        } else {
            self.purchases.append(purchase)
        }
    }
    
    mutating func isCheckedPurchases() {
        for index in 0..<purchases.count {
            purchases[index].isChecked = self.isChecked ? true : false
        }
    }
}

extension Purchase {
    mutating func addOne() {
        quantity += 1
    }
    
    mutating func subOne() {
        quantity -= 1
    }
    
    mutating func setQuantity(_ value: Double) {
        quantity = value
    }
}
