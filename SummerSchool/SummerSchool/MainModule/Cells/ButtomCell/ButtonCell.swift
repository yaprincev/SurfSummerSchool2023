//
//  ButtonCell.swift
//  SummerSchool
//
//  Created by Максим Япринцев on 01.08.2023.
//

import Foundation
import UIKit


class ButtonCell: UICollectionViewCell {
    
    // MARK: - Views
    
    @IBOutlet weak var buttonOutlet: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    
    // MARK: - UICollectionViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
    }
}


extension ButtonCell {
    func configure(skill: String) {
        if skill != "+" {
            buttonOutlet.isHidden = false
            textLabel.text = skill
        } else {
            textLabel.text = skill
            buttonOutlet.isHidden = true
            textLabel.textAlignment = .center
        }
    }
}
