//
//  RoundedShadowView.swift
//  DevHouse
//
//  Created by Sarvesh Patel on 16/09/21.
//

import Foundation
import UIKit
class RoundedShadowView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 6.0
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 2
        
    }
}
