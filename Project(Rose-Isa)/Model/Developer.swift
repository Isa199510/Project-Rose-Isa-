//
//  InfoModel.swift
//  Project(Rose-Isa)
//
//  Created by Rose on 02.04.2023.
//

struct Developer {
    let name: String
    let surname: String
    let city: String
    let gitHub: String
    let career: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}

extension Developer {
    static func getDevelopersList() -> [Developer] {
        
        var developers: [Developer] = []
        
        for developer in DataDevelopers.getDevelopersList() {
            developers.append(
                Developer(
                    name: developer.name,
                    surname: developer.surname,
                    city: developer.city,
                    gitHub: developer.gitHub,
                    career: developer.career
                )
            )
        }
        
        return developers
    }
}



