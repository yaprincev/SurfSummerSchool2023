//
//  MainPresenter.swift
//  SummerSchool
//
//  Created by Максим Япринцев on 01.08.2023.
//

import Foundation

protocol MainViewProtocol: class {
    func addSkill(skill: String)
}


protocol MainViewPresenterProtocol: class {
    init(view: MainViewProtocol, person: Person)
    var skills: [String]? { get set }
}

class MainPresenter: MainViewPresenterProtocol {
    var skills: [String]?
    weak var view: MainViewProtocol?
    let person: Person
    
    
    required init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
}
