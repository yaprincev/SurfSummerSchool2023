//
//  CommonCell.swift
//  SummerSchool
//
//  Created by Максим Япринцев on 01.08.2023.
//

import Foundation

import UIKit


class CommonCell: UICollectionViewCell {
    
    // MARK: - Views
    
    @IBOutlet weak var textLabel: UILabel!
    
    // MARK: - UICollectionViewCell
    
    func configure(with text: String) {
        textLabel.text = text
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        

    }

}

