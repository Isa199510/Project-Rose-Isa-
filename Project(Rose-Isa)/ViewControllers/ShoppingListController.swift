//
//  ShoppingListController.swift
//  Project(Rose-Isa)
//
//  Created by Иса on 18.02.2023.
//

import UIKit

final class ShoppingListController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.reloadData()
    }
    
    @IBAction func newShopping(_ sender: UIBarButtonItem) {
        let alert = self.alertForShopping("", at: nil) { title in
            self.newElememtShopping(title)
        }
        present(alert, animated: true)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        shoppings.count
        shoppingManager.shoppings.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let shoppingCell = tableView.dequeueReusableCell(withIdentifier: "shoppingCell", for: indexPath) as? ShoppingViewCell
        else { return UITableViewCell()}
        shoppingCell.configure(shoppingManager.shoppings[indexPath.row])
        return shoppingCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "") { (ac: UIContextualAction, view: UIView, succes:(Bool) -> Void) in

            let alert = self.alertForShopping(shoppingManager.shoppings[indexPath.row].name, at: indexPath.row) {title in
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
            tableView.reloadSections(IndexSet(integer: 0), with: .fade)
        }
        delete.image = UIImage(systemName: "trash")
        delete.backgroundColor = .red
        
        let swipeAction = UISwipeActionsConfiguration(actions: [delete, edit])
        swipeAction.performsFirstActionWithFullSwipe = false
        return swipeAction
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let checking = UIContextualAction(style: .normal, title: "") { (ac: UIContextualAction, view: UIView, succes:(Bool) -> Void) in
            shoppingManager.shoppings[indexPath.row].isChecked.toggle()
            shoppingManager.shoppings[indexPath.row].isCheckedPurchases()
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
            succes(true)
        }
        checking.image = shoppingManager.shoppings[indexPath.row].isChecked ? UIImage(systemName: "clear") : UIImage(systemName: "checkmark")
        checking.backgroundColor = shoppingManager.shoppings[indexPath.row].isChecked ? .red : .green
        
        let swipeAction = UISwipeActionsConfiguration(actions: [checking])
        swipeAction.performsFirstActionWithFullSwipe = false
        return swipeAction
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showGroceryList", sender: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Итого: " + (getTotalPrice().formatted()) + "р."
    }
}

extension ShoppingListController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showGroceryList" {
            guard let index = sender as? Int else { return }
            guard let groceryVC = segue.destination as? GroceryListController else { return }
            groceryVC.at = index
        }
    }

    private func getTotalPrice() -> Double {
        var amount = 0.0
        for shopping in shoppingManager.shoppings {
            amount += shopping.totalPrice
        }
        return amount
    }
    
    private func edittingElement(_ title: String, at: Int) {
        let indexPath = IndexPath(row: at, section: 0)
        shoppingManager.shoppings[at].name = title
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    private func newElememtShopping(_ title: String) {
        let indexPath = IndexPath(row: 0, section: 0)
        shoppingManager.shoppings.insert(ShoppingLists(title), at: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    private func deleteElementShopping(at: Int) {
        let indexPath = IndexPath(row: at, section: 0)
        shoppingManager.shoppings.remove(at: at)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func alertForShopping(_ text: String, at: Int?, handler: @escaping(_ title: String) -> Void) -> UIAlertController {

        let title = at != nil ? "Изменение записи" : "Новая запись"
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addTextField()
        alert.textFields?.first?.text = text
        let cancel = UIAlertAction(title: "Закрыть", style: .destructive)
        let ok = UIAlertAction(title: "Ок", style: .default) { _ in
            guard let text = alert.textFields?.first?.text else { return }
            if text.count > 3 { handler(text) }
        }
        alert.addAction(ok)
        alert.addAction(cancel)
        return alert
    }
    
}
