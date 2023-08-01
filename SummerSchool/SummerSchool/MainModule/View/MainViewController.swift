//
//  ViewController.swift
//  SummerSchool
//
//  Created by Максим Япринцев on 01.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainViewPresenterProtocol!
    var person: Person!
    
    @IBOutlet weak var personImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureApperance()
    }
}

extension MainViewController: MainViewProtocol {
    func setPerson(person: Person) {
        self.person = person
    }
}

private extension MainViewController {
    func configureApperance() {
        self.presenter.showPersonInfo()
        personImage.image = person.image
        
    }
}
