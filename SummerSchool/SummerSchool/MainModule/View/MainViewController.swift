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
    @IBOutlet weak var fioLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    
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
        
        view.backgroundColor = UIColor(red: 0xF3/255.0, green: 0xF3/255.0, blue: 0xF5/255.0, alpha: 1.0)
        
        personImage.image = person.image
        
        fioLabel.text = person.lastName + " " + person.firstName + " " + person.patronymic
        fioLabel.textColor = UIColor(red: 0x31/255.0, green: 0x31/255.0, blue: 0x31/255.0, alpha: 1.0)
        fioLabel.textAlignment = .center
        fioLabel.font = UIFont.boldSystemFont(ofSize: 24)
        fioLabel.numberOfLines = 0
        

    }
}
