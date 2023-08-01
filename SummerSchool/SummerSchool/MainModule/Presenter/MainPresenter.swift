//
//  MainPresenter.swift
//  SummerSchool
//
//  Created by Максим Япринцев on 01.08.2023.
//

import Foundation

protocol MainViewProtocol: class {
    func setPerson(person: Person, skills: [String])
}


protocol MainViewPresenterProtocol: class {
    init(view: MainViewProtocol, person: Person)
    var skills: [String] { get set }
    func showPersonInfo()
}

class MainPresenter: MainViewPresenterProtocol {
    var skills: [String] = ["cxc", "dsdsds", "sasZDSSDSDSa", "1", "21"]
    weak var view: MainViewProtocol?
    let person: Person
    
    
    required init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showPersonInfo() {
        self.view?.setPerson(person: person, skills: self.skills)
    }
    
}
