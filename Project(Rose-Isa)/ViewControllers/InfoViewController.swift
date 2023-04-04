//
//  InfoViewController.swift
//  Project(Rose-Isa)
//
//  Created by Rose on 04.04.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var devPhoto: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var careerLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var gitHubLabel: UILabel!
    
    var developer: Developer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let developer = developer else { return }
        devPhoto.image = UIImage(named: developer.name)
//        devPhoto.image = UIImage(developer.fullName) //отображение фото из ассетса?
        devPhoto.layer.cornerRadius = 10
        
        fullNameLabel.text = developer.fullName
        careerLabel.text = developer.career
        
        cityLabel.text = "город:  \(developer.city)"
        gitHubLabel.text = "gitHub:  \(developer.gitHub)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
