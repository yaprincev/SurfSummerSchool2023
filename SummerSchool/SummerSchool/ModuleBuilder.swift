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
        let person = Person(lastName: "Япринцев", firstName: "Максим", patronymic: "Александрович", mainInfo: "Junior iOS-разработчик, опыт более 1-го года", city: "Воронеж")
        let presenter = MainPresenter(view: view, person: person)
        view.presenter = presenter
        return view
    }
}
