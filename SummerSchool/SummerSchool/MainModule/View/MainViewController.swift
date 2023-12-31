//
//  ViewController.swift
//  SummerSchool
//
//  Created by Максим Япринцев on 01.08.2023.
//

import UIKit

class MainViewController: UIViewController, UIScrollViewDelegate {
    
    // MARK: - Properties
    
    var presenter: MainViewPresenterProtocol!
    var person: Person!
    var skills: [String]!
    var editMode: Bool = false
    //let scrollView = UIScrollView()

    // MARK: - Constants
    
    private enum Constants {
        static let spaceBetweenElements: CGFloat = 12
        static let spaceBetweenRows: CGFloat = 6
    }
    
    // MARK: - Views
    
    @IBOutlet private weak var personImage: UIImageView!
    @IBOutlet private weak var fioLabel: UILabel!
    @IBOutlet private weak var infoLabel: UILabel!
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var cityImage: UIImageView!
    @IBOutlet private weak var bottomView: UIView!
    @IBOutlet private weak var skillsLabel: UILabel!
    @IBOutlet private weak var pencilButton: UIButton!
    @IBOutlet private weak var personInfoLabel: UILabel!
    @IBOutlet private weak var aboutYourselfLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTopView()
        configureBottomView()
        configureCollection(with: editMode)
       // configureScrollView()
    }
    
    @IBAction func changeButton(_ sender: Any) {
        if editMode == false {
            editMode = true
            skills.append("+")
            configureCollection(with: editMode)
            collectionView.reloadData()
            pencilButton.setImage(UIImage(named: "Circle with tick"), for: .normal)
        } else {
            editMode = false
            skills.removeLast()
            configureCollection(with: editMode)
            collectionView.reloadData()
            pencilButton.setImage(UIImage(named: "Pencil"), for: .normal)
        }
    }
}

// MARK: - Protocol Extension

extension MainViewController: MainViewProtocol {
    func setPerson(person: Person, skills: [String]) {
        self.person = person
        self.skills = skills
    }
}

// MARK: - Private Methods

private extension MainViewController {
    
    func configureCollection(with editMode: Bool) {
        if editMode == false {
            collectionView.register(UINib(nibName: "CommonCell", bundle: .main), forCellWithReuseIdentifier: "CommonCell")
        } else {
            collectionView.register(UINib(nibName: "ButtonCell", bundle: .main), forCellWithReuseIdentifier: "ButtonCell")
        }
        collectionView.dataSource = self
        collectionView.contentInset = .init(top: 10, left: 16, bottom: 10, right: 16)
        collectionView.delegate = self
    }
    // TODO: - ScrollView
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
    
    
    
    func configureAlertController() {
        let alert = UIAlertController(title: "Добавление навыка", message: "Введите название навыка", preferredStyle: .alert)
        
        alert.addTextField { (text) in
            text.placeholder = "Введите название"
        }
        
        let actionNo = UIAlertAction(title: "Отмена", style: .default)
        
        let actionYes = UIAlertAction(title: "Добавить", style: .cancel) { (_) in
            if let text = alert.textFields?.first {
                if text.text != "" {
                    self.skills.removeLast()
                    self.skills.append(text.text!)
                    self.skills.append("+")
                    self.collectionView.reloadData()
                }
            }
        }
        alert.addAction(actionYes)
        alert.addAction(actionNo)
        self.present(alert, animated: true)
    }
}



// MARK: - UICollection


extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if editMode {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ButtonCell.self)", for: indexPath)
            if let cell = cell as? ButtonCell {
                
                let skill = self.skills[indexPath.row]
                cell.configure(skill: skill)
            }
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CommonCell.self)", for: indexPath)
            if let cell = cell as? CommonCell {
                
                let skill = self.skills[indexPath.row]
                cell.configure(with: skill)
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.skills.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.spaceBetweenRows
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.spaceBetweenElements
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = skills[indexPath.row]
        let font = UIFont.systemFont(ofSize: 14)
        let size = text.sizeCounter(with: font)
        return CGSize(width: size.width + 80, height: 44)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if editMode && indexPath.row != skills.count - 1 {
            skills.remove(at: indexPath.row)
            collectionView.reloadData()
        } else if editMode && indexPath.row == skills.count - 1 {
            configureAlertController()
        }
    }
    
    

}


