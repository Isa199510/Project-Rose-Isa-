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

//class InfoViewController: UIViewController {
//    
//    
//    @IBOutlet weak var devPhoto: UIImageView!
//    @IBOutlet weak var fullNameLabel: UILabel!
//    @IBOutlet weak var careerLabel: UILabel!
//    @IBOutlet weak var cityLabel: UILabel!
//    @IBOutlet weak var gitHubLabel: UILabel!
//    
//    var developer: Developer!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        devPhoto.image = UIImage(named: "rose")
//        devPhoto.layer.cornerRadius = 15
//        
//        fullNameLabel.text = developer.fullName
//        careerLabel.text = developer.career
//        
//        cityLabel.text = "город:  \(developer.city)"
//        gitHubLabel.text = "gitHub:  \(developer.gitHub)"
//    }
//}

