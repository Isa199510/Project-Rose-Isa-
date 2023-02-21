//
//  GroceryViewCell.swift
//  Project(Rose-Isa)
//
//  Created by Иса on 21.02.2023.
//

import UIKit

class GroceryViewCell: UITableViewCell {
    
    @IBOutlet weak var nameGroceryLabel: UILabel!
    @IBOutlet weak var priceGroceryLabel: UILabel!
    @IBOutlet weak var quantityGroceryLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var subButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        addButton.layer.cornerRadius = addButton.bounds.width / 2
        subButton.layer.cornerRadius = subButton.bounds.width / 2
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    func configure(_ name: String) {
        nameGroceryLabel.text = name
    }
    
    func configure(_ purchase: Purchase) {
        subButton.isEnabled = purchase.quantity > 0 ? true : false
        addButton.isEnabled = purchase.quantity < 100 ? true : false
        
        nameGroceryLabel.text = purchase.name
        priceGroceryLabel.text = purchase.price.formatted()
        quantityGroceryLabel.text = purchase.quantity.formatted()
    }
}
