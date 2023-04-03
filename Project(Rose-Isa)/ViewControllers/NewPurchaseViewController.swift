//
//  NewPurchaseViewController.swift
//  Project(Rose-Isa)
//
//  Created by Rose on 18.02.2023.
//

import UIKit

final class NewPurchaseViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var quantityStepperOutlet: UIStepper!
    
    var indexPurchase: Int!
    var delegate: NewPurchaseVewControllerDelegate!
    
    
    var name = ""
    var price = 0.0
    var quantity = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = name
        priceTextField.text = price.formatted() + " "
        quantityLabel.text = quantity.formatted() + " шт"
        quantityStepperOutlet.value = quantity
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        quantity = sender.value
        quantityLabel.text = quantity.formatted() + " шт"
    }
    
    
    @IBAction func cancelButton() {
        dismiss(animated: true)
    }
    
    
    @IBAction func saveButton() {
        let newPurchase = Purchase(
            name: nameTextField.text ?? "",
            quantity: quantity,
            price: price
        )
        
        if let index = indexPurchase {
            delegate.editPurchase(for: newPurchase, at: index)
        } else {
            delegate.addNewPurchase(for: newPurchase)
        }
        dismiss(animated: true)
    }

    
    func configure(_ purchase: Purchase, indexPurchase: Int?) {
        name = purchase.name
        price = purchase.price
        quantity = purchase.quantity
        self.indexPurchase = indexPurchase
    }
}


