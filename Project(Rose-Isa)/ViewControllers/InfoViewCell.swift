//
//  InfoViewCell.swift
//  Project(Rose-Isa)
//
//  Created by Иса on 07.04.2023.
//

import UIKit

final class InfoViewCell: UITableViewCell {
    
    @IBOutlet weak var imageDeveloper: UIImageView!
    @IBOutlet weak var nameDeveloper: UILabel!
    
    func configure(developer: Developer) {
        imageDeveloper.image = UIImage(named: developer.fullName)
        imageDeveloper.contentMode = .scaleAspectFill
        imageDeveloper.layer.cornerRadius = 30
        nameDeveloper.text = developer.fullName
    }
}
