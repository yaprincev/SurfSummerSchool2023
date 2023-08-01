//
//  ViewController.swift
//  SummerSchool
//
//  Created by Максим Япринцев on 01.08.2023.
//

import UIKit

class MainViewController: UIViewController, UIScrollViewDelegate {
    
    var presenter: MainViewPresenterProtocol!
    var person: Person!

    
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var fioLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityImage: UIImageView!
  //  @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var skillsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTopView()
        configureBottomView()
      //  configureScrollView()
    }
}

extension MainViewController: MainViewProtocol {
    func setPerson(person: Person) {
        self.person = person
    }
}

private extension MainViewController {
//    func configureScrollView() {
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.showsVerticalScrollIndicator = true
//        scrollView.alwaysBounceVertical = true
//
//        NSLayoutConstraint.activate([
//            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
//        ])
//        view.addSubview(scrollView)
//    }
    func configureTopView() {
        self.presenter.showPersonInfo()
        
        view.backgroundColor = UIColor(red: 0xF3/255.0, green: 0xF3/255.0, blue: 0xF5/255.0, alpha: 1.0)
        
        personImage.image = person.image
        
        fioLabel.text = person.lastName + " " + person.firstName + " " + person.patronymic
        fioLabel.textColor = UIColor(red: 0x31/255.0, green: 0x31/255.0, blue: 0x31/255.0, alpha: 1.0)
        fioLabel.textAlignment = .center
        fioLabel.font = UIFont.boldSystemFont(ofSize: 24)
        fioLabel.numberOfLines = 0
        
        infoLabel.text = person.mainInfo
        infoLabel.textColor = UIColor(red: 0x96/255.0, green: 0x95/255.0, blue: 0x9B/255.0, alpha: 1.0)
        infoLabel.font = UIFont.systemFont(ofSize: 14)
        infoLabel.numberOfLines = 2
        infoLabel.textAlignment = .center
        
        cityLabel.text = person.city
        cityLabel.textAlignment = .center
        cityLabel.font = UIFont.systemFont(ofSize: 14)
        cityLabel.textColor = UIColor(red: 0x96/255.0, green: 0x95/255.0, blue: 0x9B/255.0, alpha: 1.0)
        cityLabel.numberOfLines = 1
        
        cityImage.image = UIImage(named: "City Image")
        
    }
    
    func configureBottomView() {
        bottomView.backgroundColor = UIColor.white
        
        skillsLabel.text = "Мои навыки"
        skillsLabel.textColor = UIColor(red: 0x31/255.0, green: 0x31/255.0, blue: 0x31/255.0, alpha: 1.0)
        skillsLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    }
}
