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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(_ shopping: ShoppingLists) {
        nameLabel.text = shopping.name
        totalPriceLabel.text = shopping.totalPrice == 0 ? "" : "Общая сумма: \(shopping.totalPrice)"
    }
}
