//
//  InfoViewController.swift
//  Project(Rose-Isa)
//
//  Created by Rose on 04.04.2023.
//

import UIKit

final class InfoViewController: UIViewController {
    
    @IBOutlet weak var devPhoto: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var careerLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var gitHubLabel: UILabel!
    
    var developer: Developer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
 
    func configure() {
        guard let developer = developer else { return }
        devPhoto.image = UIImage(named: developer.fullName)
        fullNameLabel.text = "Имя и Фамилия: \(developer.fullName)"
        careerLabel.text = "Должность: \(developer.career)"
        cityLabel.text = "Город: \(developer.city)"
        gitHubLabel.text = "Git Hub: \(developer.gitHub)"
    }
}
