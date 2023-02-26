//
//  GroceryListController.swift
//  Project(Rose-Isa)
//
//  Created by Иса on 20.02.2023.
//

import UIKit

protocol GroceryViewCellDElegate {
    func changesQuantityAdd(_ cell: GroceryViewCell)
    func changesQuantitySub(_ cell: GroceryViewCell)
}

class GroceryListController: UITableViewController {
    
    var at: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = shoppings[at].name
        tableView.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let index = self.at {
            return shoppings[index].purchases.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let groceryCell = tableView.dequeueReusableCell(withIdentifier: "groceryCell", for: indexPath) as? GroceryViewCell else { return UITableViewCell() }
        if let index = self.at {
            groceryCell.configure(shoppings[self.at].purchases[indexPath.row])
            
            groceryCell.addButton.tag = indexPath.row
            groceryCell.subButton.tag = indexPath.row
            
            groceryCell.subButton.isEnabled = (shoppings[index].purchases[indexPath.row]).quantity > 0 ? true : false
            groceryCell.addButton.isEnabled = (shoppings[index].purchases[indexPath.row]).quantity < 100 ? true : false
            groceryCell.backgroundColor = shoppings[index].purchases[indexPath.row].isChecked ? .green : .white
            
            groceryCell.indexShopping = at
            groceryCell.delegate = self
            
        }
        return groceryCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showNewPurchase", sender: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var amount = 0.0
        for purchase in shoppings[at].purchases {
            amount += purchase.amount
        }
        return "Итого: \(amount)р."
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "") { (ac: UIContextualAction, view: UIView, succes:(Bool) -> Void) in
            // editing...
            succes(true)
        }
        edit.image = UIImage(systemName: "pencil")
        edit.backgroundColor = .gray
        
        let delete = UIContextualAction(style: .normal, title: "") { (ac: UIContextualAction, view: UIView, succes:(Bool) -> Void) in
            guard let at = self.at else { return Void()}
            shoppings[at].purchases.remove(at: indexPath.row)
            self.tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
            succes(true)
        }
        delete.image = UIImage(systemName: "trash")
        delete.backgroundColor = .red
        
        let swipeAction = UISwipeActionsConfiguration(actions: [delete, edit])
        swipeAction.performsFirstActionWithFullSwipe = false
        return swipeAction
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let checking = UIContextualAction(style: .normal, title: "") { (ac: UIContextualAction, view: UIView, succes:(Bool) -> Void) in
            shoppings[self.at].purchases[indexPath.row].isChecked.toggle()
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
            succes(true)
        }
        checking.backgroundColor = shoppings[at].purchases[indexPath.row].isChecked ? .red : .green
        checking.image = shoppings[at].purchases[indexPath.row].isChecked ? UIImage(systemName: "clear") : UIImage(systemName: "checkmark")
        
        let swipeAction = UISwipeActionsConfiguration(actions: [checking])
        swipeAction.performsFirstActionWithFullSwipe = false
        return swipeAction
    }
}

extension GroceryListController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    
    enum Operations {
        case add, sub
    }
    
    func сhangesQuantity(_ index: Int, operation: Operations) {
        guard let at = at else { return }
        let indexSet = IndexSet(integer: 0)
        switch operation {
        case .add:
            shoppings[at].purchases[index].quantity += 1
        case .sub:
            shoppings[at].purchases[index].quantity -= 1
        }
        tableView.reloadSections(indexSet, with: .automatic)
    }
}

extension GroceryListController: GroceryViewCellDElegate {
    func changesQuantityAdd(_ cell: GroceryViewCell) {
        let index = cell.addButton.tag
        сhangesQuantity(index, operation: .add)
    }
    
    func changesQuantitySub(_ cell: GroceryViewCell) {
        let index = cell.addButton.tag
        сhangesQuantity(index, operation: .sub)
    }
}
