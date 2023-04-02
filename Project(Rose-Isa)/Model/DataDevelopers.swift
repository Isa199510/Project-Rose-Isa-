//
//  DataDevelopers.swift
//  Project(Rose-Isa)
//
//  Created by Rose on 02.04.2023.
//

class DataDeveloper {
    
    static let developers = DataDeveloper.getDevelopersList()
    
    let name: String
    let surname: String
    let city: String
    let gitHub: String
    let career: String
    
    static func getDevelopersList() -> [DataDeveloper] {
        
        let developersList = [
            DataDeveloper(
                name: "Isa",
                surname: "Arbukhov",
                city: "City",
                gitHub: "Isa199510",
                career: "iOS developer"
            ),
            DataDeveloper(
                name: "Rose",
                surname: "Khaldeeva",
                city: "Almaty",
                gitHub: "HelloRose2211",
                career: "iOS develope"
            )
        ]
        
        return developersList
    }
    
    private init(
        name: String,
        surname: String,
        city: String,
        gitHub: String,
        career: String
    ) {
        self.name = name
        self.surname = surname
        self.city = city
        self.gitHub = gitHub
        self.career = career
    }
}

