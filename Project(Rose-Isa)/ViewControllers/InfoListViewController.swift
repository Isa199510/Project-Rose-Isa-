//
//  InfoListViewController.swift
//  Project(Rose-Isa)
//
//  Created by Rose on 04.04.2023.
//

import UIKit

class DescriptionCell: UITableViewCell {
    
    @IBOutlet weak var aboutApp: UILabel!
    @IBOutlet weak var developers: UILabel!
}


class InfoListViewController: UITableViewController {
    
    var developers: [Developer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 50
        tableView.tableFooterView = UIView()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return UITableView.automaticDimension
        } else {
            return 50
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "description", for: indexPath) as? DescriptionCell {
                cell.aboutApp.text = "Удобное приложение для ведения списка покупок. Можно разделять продукты на категории, отмечать количество, а приложение подсчитает общую сумму покупок"
                cell.developers.text = "Разработчики:"
                
                return cell
                
            } else {
                fallthrough
            }
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
            var content = cell.defaultContentConfiguration()
            let developer = developers[indexPath.row - 1]
            
            content.text = developer.fullName
            content.textProperties.font = UIFont.systemFont(ofSize: 18.0)
            
            content.image = UIImage(named: developer.fullName)
            content.imageProperties.cornerRadius = tableView.rowHeight / 2
            
            cell.accessoryType = .disclosureIndicator
            cell.contentConfiguration = content
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let developerDetailVC = segue.destination as? InfoViewController else { return }
        
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let developer = developers[indexPath.row - 1]
        
        developerDetailVC.developer = developer
    }
}



    

    

  
        
       
        
