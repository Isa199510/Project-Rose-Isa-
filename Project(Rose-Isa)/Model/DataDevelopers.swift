//
//  DataDevelopers.swift
//  Project(Rose-Isa)
//
//  Created by Rose on 02.04.2023.
//

class DataDevelopers {
    
    static let developers = DataDevelopers.getDevelopersList()
    
    let name: String
    let surname: String
    let city: String
    let gitHub: String
    let career: String
    
    static func getDevelopersList() -> [DataDevelopers] {
        
        let developersList = [
            DataDevelopers(
                name: "Иса",
                surname: "Арбухов",
                city: "город",
                gitHub: "Isa199510",
                career: "iOS developer"
            ),
            DataDevelopers(
                name: "Роза",
                surname: "Халдеева",
                city: "Алматы",
                gitHub: "HelloRose2211",
                career: "iOS developer"
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

