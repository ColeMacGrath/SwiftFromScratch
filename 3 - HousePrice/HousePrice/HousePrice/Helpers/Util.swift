//
//  Util.swift
//  HousePrice
//
//  Created by Moisés Córdova on 14/10/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CardButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 2.0 //valor de las equinas a redondear
    @IBInspectable var borderWidth: CGFloat = 0 //Ancho del borde
    @IBInspectable var borderColor: CGColor = UIColor.black.cgColor //Color del borde
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor
        clipsToBounds = true
    }
}
