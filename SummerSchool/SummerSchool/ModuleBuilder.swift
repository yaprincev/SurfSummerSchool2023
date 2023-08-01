//
//  ModuleBuilder.swift
//  SummerSchool
//
//  Created by Максим Япринцев on 01.08.2023.
//

import Foundation
import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
}

class ModelBuilder: Builder {
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let person = Person(lastName: "Япринцев", firstName: "Максим", patronymic: "Александрович", mainInfo: "Junior iOS-разработчик, опыт более 1-го года", city: "Воронеж", image: UIImage(named: "Person Photo")!, detailInfo: "Experienced software engineer skilled in developing scalable and maintainable systemsExperienced software engineer skilled in developing scalable and maintainable systemsExperienced software engineer skilled in developing scalable and maintainable systemsExperienced software engineer skilled in developing scalable and maintainable systemsExperienced software engineer skilled in developing scalable and maintainable systems")
        let presenter = MainPresenter(view: view, person: person)
        view.presenter = presenter
        view.navigationItem.title = "Профиль"
        return view
    }
}
