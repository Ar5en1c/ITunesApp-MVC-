//
//  Extensions.swift
//  iTuneArtist
//
//  Created by Kuldeep Singh on 6/14/24.
//

import Foundation
import UIKit

extension UIButton {
    
    func setBasicBorderStyling() {
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.tintColor.cgColor
    }
    
    func setBasicAttributedTitleStyling(text: String, fontSize: Int) {
        let labelText = "$\(text)"
        let attributedTitle = NSMutableAttributedString(string: labelText)
        let wholeRange = NSRange(location: 0, length: attributedTitle.length)
        attributedTitle.addAttribute(.font, value: UIFont.systemFont(ofSize: CGFloat(fontSize)), range: wholeRange)
        self.setAttributedTitle(attributedTitle, for: .normal)
    }
}
