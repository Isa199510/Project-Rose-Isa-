//
//  ShoppingListController.swift
//  Project(Rose-Isa)
//
//  Created by Иса on 18.02.2023.
//

import UIKit

class ShoppingListController: UITableViewController {
    
    var shoppings = getShoppingList()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func newShopping(_ sender: UIBarButtonItem) {
        let alert = self.alertForShopping("", at: nil) { title in
            self.newElememtShopping(title)
        }
        present(alert, animated: true)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        shoppings.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let shoppingCell = tableView.dequeueReusableCell(withIdentifier: "shoppingCell", for: indexPath) as? ShoppingViewCell
        else { return UITableViewCell()}
        shoppingCell.configure(shoppings[indexPath.row])
        return shoppingCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "") { (ac: UIContextualAction, view: UIView, succes:(Bool) -> Void) in

            let alert = self.alertForShopping(self.shoppings[indexPath.row].name, at: indexPath.row) {title in
                self.edittingElement(title, at: indexPath.row)
            }
            self.present(alert, animated: true)
            succes(true)
        }
        edit.image = UIImage(systemName: "pencil")
        edit.backgroundColor = .gray
        
        let delete = UIContextualAction(style: .normal, title: "") { (ac: UIContextualAction, view: UIView, succes:(Bool) -> Void) in

            self.deleteElementShopping(at: indexPath.row)
            succes(true)
        }
        delete.image = UIImage(systemName: "trash")
        delete.backgroundColor = .red
        
        let swipeAction = UISwipeActionsConfiguration(actions: [delete, edit])
        swipeAction.performsFirstActionWithFullSwipe = false
        
        return swipeAction
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        
        let delete = UIContextualAction(style: .normal, title: "") { (ac: UIContextualAction, view: UIView, succes:(Bool) -> Void) in

            let cell = self.tableView.cellForRow(at: indexPath)
            cell?.backgroundColor = .green
            succes(true)
        }
        delete.image = UIImage(systemName: delete.image == UIImage(systemName: "checkmark") ? "clear" : "checkmark")
        delete.backgroundColor = delete.backgroundColor == .green ? .red : .green
        
        let swipeAction = UISwipeActionsConfiguration(actions: [delete])
        return swipeAction
    }
}

extension ShoppingListController {
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let groceryVC = segue.destination as? GroceryListController {
//            groceryVC.shopping = shoppings[sender as? Int ?? 0] as ShoppingLists
//            groceryVC.at = sender as? Int ?? 0
//        }
//    }
    
    private func edittingElement(_ title: String, at: Int) {
        let indexPath = IndexPath(row: at, section: 0)
        shoppings[at].name = title
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    private func newElememtShopping(_ title: String) {
        let indexPath = IndexPath(row: 0, section: 0)
        shoppings.insert(ShoppingLists(title), at: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    private func deleteElementShopping(at: Int) {
        let indexPath = IndexPath(row: at, section: 0)
        shoppings.remove(at: at)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
 
    func alertForShopping(_ text: String, at: Int?, handler: @escaping(_ title: String) -> Void) -> UIAlertController {

        let title = at != nil ? "Изменение записи" : "Новая запись"
        
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addTextField()
        alert.textFields?.first?.text = text
        let cancel = UIAlertAction(title: "Cancel", style: .destructive)
        let ok = UIAlertAction(title: "OK", style: .default) { _ in
            guard let text = alert.textFields?.first?.text else { return }
            if text.count > 3 {
                handler(text)
            }
        }
        alert.addAction(ok)
        alert.addAction(cancel)
        
        return alert
    }
    
}
