//
//  GroceryListController.swift
//  Project(Rose-Isa)
//
//  Created by Иса on 20.02.2023.
//

import UIKit

class GroceryListController: UITableViewController {
    
    var shopping: ShoppingLists!
    var at: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = shopping.name
        tableView.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    }
    
    @IBAction func addNewPurchase(_ sender: UIBarButtonItem) {
        
    }
    
    
    @IBAction func addQuantityButton(_ sender: UIButton) {
        self.сhangesQuantity(sender.tag, operation: .add)
    }
    
    @IBAction func subQuantityButton(_ sender: UIButton) {
        self.сhangesQuantity(sender.tag, operation: .sub)
    }
    
    
    
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let shopping = self.shopping {
            return shopping.purchases?.count ?? 0
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groceryCell", for: indexPath) as? GroceryViewCell else { return UITableViewCell() }
        if let shopping = self.shopping {
            cell.configure(shopping.purchases?[indexPath.row] ?? Purchase())
            cell.addButton.tag = indexPath.row
            cell.subButton.tag = indexPath.row
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        var amount = 0.0
        shopping.purchases.map { purchases in
            for purchase in purchases {
                amount += purchase.amount
            }
        }
        return "Итого: \(amount)р."
    }
}

extension GroceryListController {
    
    enum Operations {
        case add, sub
    }
    
    func сhangesQuantity(_ index: Int, operation: Operations) {
        guard let at = at else { return }
        let indexSet = IndexSet(integer: 0)
        switch operation {
        case .add:
            shoppings[at].purchases?[index].quantity += 1
        case .sub:
            shoppings[at].purchases?[index].quantity -= 1
        }
        shopping = shoppings[at]
        tableView.reloadSections(indexSet, with: .automatic)
    }
}
