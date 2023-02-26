//
//  ShoppingViewCell.swift
//  Project(Rose-Isa)
//
//  Created by Иса on 18.02.2023.
//

import UIKit

class ShoppingViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!

    func configure(_ shopping: ShoppingLists) {
        nameLabel.text = shopping.name
        totalPriceLabel.text = shopping.totalPrice == 0 ? "" : "Общая сумма: \(shopping.totalPrice)"
        self.backgroundColor = shopping.isChecked ? .green : .white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
}
