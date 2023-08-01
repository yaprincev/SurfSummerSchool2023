//
//  ViewController.swift
//  SummerSchool
//
//  Created by Максим Япринцев on 01.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}


extension MainViewController: MainViewProtocol {
    func addSkill(skill: String) {
        presenter.skills?.append(skill)
    }
    

    
    
}
