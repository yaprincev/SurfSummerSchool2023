//
//  CommonCell.swift
//  SummerSchool
//
//  Created by Максим Япринцев on 01.08.2023.
//

import Foundation

import UIKit


class CommonCell: UICollectionViewCell {
    
    @IBOutlet weak var textLabel: UILabel!
    
    func configure(skill: String) {
        textLabel.text = skill
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

