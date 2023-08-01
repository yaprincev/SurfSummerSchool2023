//
//  StringExtension.swift
//  SummerSchool
//
//  Created by Максим Япринцев on 01.08.2023.
//

import Foundation
import UIKit

extension String {
    func sizeCounter(with font: UIFont) -> CGSize {
        let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font]
        let size = (self as NSString).size(withAttributes: attributes)
        return size
    }
}
