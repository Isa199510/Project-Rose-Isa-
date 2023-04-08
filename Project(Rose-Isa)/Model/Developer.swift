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
        [
            Developer(
                name: "Иса",
                surname: "Арбухов",
                city: "Москва",
                gitHub: "Isa199510",
                career: "iOS developer"
            ),
            Developer(
                name: "Роза",
                surname: "Халдеева",
                city: "Алматы",
                gitHub: "HelloRose2211",
                career: "iOS developer"
            )
        ]
        
    }
}


