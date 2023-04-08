//
//  InfoListViewController.swift
//  Project(Rose-Isa)
//
//  Created by Rose on 04.04.2023.
//

import UIKit

final class InfoListViewController: UITableViewController {
    
    let developerList = Developer.getDevelopersList()

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        developerList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let infoCell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as? InfoViewCell else { return UITableViewCell()}
        infoCell.configure(developer: developerList[indexPath.row])
        return infoCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showInfoVC", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let index = sender as? Int else { return }
        guard let infoVC = segue.destination as? InfoViewController else { return }
        infoVC.developer = developerList[index]
    }
}
