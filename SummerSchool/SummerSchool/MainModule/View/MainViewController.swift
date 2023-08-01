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
    //let scrollView = UIScrollView()

    
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var fioLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var skillsLabel: UILabel!
    @IBOutlet weak var pencilButton: UIButton!
    @IBOutlet weak var personInfoLabel: UILabel!
    @IBOutlet weak var aboutYourselfLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTopView()
        configureBottomView()
        collectionView.register(UINib(nibName: "\(CommonCell.self)", bundle: .main), forCellWithReuseIdentifier: "\(CommonCell.self)")
        collectionView.dataSource = self
        //collectionView.delegate = self
       // configureScrollView()
        
    }
    @IBAction func changeButton(_ sender: Any) {
        
        
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
//        for subview in view.subviews {
//            scrollView.addSubview(subview)
//        }
        
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
        
        pencilButton.setImage(UIImage(named: "Pencil"), for: .normal)
        pencilButton.titleLabel?.text = ""
        
        personInfoLabel.text = person.detailInfo
        personInfoLabel.font = UIFont.systemFont(ofSize: 14)
        personInfoLabel.textColor = UIColor(red: 0x31/255.0, green: 0x31/255.0, blue: 0x31/255.0, alpha: 1.0)
        personInfoLabel.numberOfLines = 0
        
        aboutYourselfLabel.text = "О себе"
        aboutYourselfLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        aboutYourselfLabel.textColor = UIColor(red: 0x31/255.0, green: 0x31/255.0, blue: 0x31/255.0, alpha: 1.0)
    }
}


extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.skills.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CommonCell.self)", for: indexPath)
        if let cell = cell as? CommonCell {
            
            let skill = presenter.skills[indexPath.row]
            cell.configure(skill: skill)
            

        }
        return cell
    }
    
    
}
