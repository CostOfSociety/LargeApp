//
//  AboutMe.swift
//  LargeApp
//
//  Created by Святослав on 04.10.2022.
//

struct User {
    let username: String
    let password: String
    let person: Person
    
    static func getDataAboutPerson() -> User {
        User(
            username: "User",
            password: "Password",
            person: Person.getDescription()
        )
    }
}

struct Person {
    let firstName: String
    let lastName: String
    let company: String
    let department: String
    let jobTitle: String
    let textDescription: String
    
    static func getDescription() -> Person {
        Person(
            firstName: "Святослав",
            lastName: "Афанасьев",
            company: "Зеленый Гигант",
            department: "Запрещенная информация",
            jobTitle: "Аналитик",
            textDescription: """
            Родился в Казани. Сейчас живу в МСК.
            Анализирую продажи и изучаю Swift)
            """
        )
    }
    
}
