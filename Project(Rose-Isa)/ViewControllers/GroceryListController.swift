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

protocol NewPurchaseVewControllerDelegate {
    func editPurchase(for purchase: Purchase, at index: Int?)
    func addNewPurchase(for purchase: Purchase)
}

final class GroceryListController: UITableViewController {
    
    var at: Int!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        title = shoppings[at].name
        tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    @IBAction func showNewGroceryButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "showNewPurchase", sender: nil)
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
            self.performSegue(withIdentifier: "showEditPurchase", sender: indexPath.row)
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
        guard let newPurchaseVC = segue.destination as? NewPurchaseViewController else { return }
        if segue.identifier == "showNewPurchase" {
            newPurchaseVC.delegate = self

        } else if segue.identifier == "showEditPurchase" {
            guard let indexShopping = at else { return }
            guard let indexPurchase = sender as? Int else { return }
            newPurchaseVC.delegate = self
            let newPurchase = shoppings[indexShopping].purchases[indexPurchase]
            newPurchaseVC.configure(newPurchase, indexPurchase: indexPurchase)
        }
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

extension GroceryListController: NewPurchaseVewControllerDelegate {
    
    func addNewPurchase(for purchase: Purchase) {
        guard let indexShopping = at else { return }
        shoppings[indexShopping].purchases.insert(purchase, at: 0)
        tableView.reloadData()
    }
    
    func editPurchase(for purchase: Purchase, at index: Int?) {
        guard let indexShopping = at else { return }
        if let index = index {
            shoppings[indexShopping].purchases[index] = purchase
        }
        tableView.reloadData()
    }

}
