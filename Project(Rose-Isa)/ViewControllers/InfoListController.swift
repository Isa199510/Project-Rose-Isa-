//
//  InfoListController.swift
//  Project(Rose-Isa)
//
//  Created by Иса on 19.02.2023.
//

import UIKit

class InfoListController: UITableViewController {
    let persons = Person.getPersons()
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
//        let content = tableView
        cell.imageView?.image = UIImage(systemName: "checkmark")
        cell.textLabel?.text = persons[indexPath.row].name
        return cell
    }
    
 
}

extension InfoListController {
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}



class InfoViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
