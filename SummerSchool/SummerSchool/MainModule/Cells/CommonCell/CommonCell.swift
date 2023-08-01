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
    func configure(with text: String) {
        textLabel.text = text

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        

    }

}

