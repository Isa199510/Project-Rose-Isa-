//
//  GroceryViewCell.swift
//  Project(Rose-Isa)
//
//  Created by Иса on 21.02.2023.
//

import UIKit

final class GroceryViewCell: UITableViewCell {
    
    var delegate: GroceryViewCellDElegate!
    var indexShopping: Int?
    
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

    func configure(_ purchase: Purchase) {
        nameGroceryLabel.text = purchase.name
        priceGroceryLabel.text = "\(purchase.price)р."
        quantityGroceryLabel.text = purchase.quantity.formatted()
    }
    
    @IBAction func addButtonAction(_ sender: UIButton) {
        delegate.changesQuantityAdd(self)
    }
    
    @IBAction func subButtonAction(_ sender: UIButton) {
        delegate.changesQuantitySub(self)
    }
}
