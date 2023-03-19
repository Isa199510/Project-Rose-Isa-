//
//  NewPurchaseViewController.swift
//  Project(Rose-Isa)
//
//  Created by Rose on 18.02.2023.
//

import UIKit

class NewPurchaseViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var priceTextField: UITextField!
    
    var purchase: Purchase!
    var delegate: NewPurchaseVewControllerDelegate!
    
    var nameOfPurchase = ""
    var quantity = 0
    var price = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        priceTextField.delegate = self
        nameTextField.text = String(purchase.name)
        priceTextField.text = String(purchase.price)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        quantityLabel.text = String(format: "%.0f", sender.value)
        quantity = Int(sender.value)
    }
    
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        view.endEditing(true)
        delegate.addNewItems(for: purchase)
        dismiss(animated: true)
    }
}

// доделать
extension NewPurchaseViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == nameTextField {
            purchase.name = textField.text
        } else {
            purchase.price = textField.text
        }
    }
}
