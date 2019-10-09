//
//  CardImage.swift
//  Musixcrape
//
//  Created by Moisés Córdova on 09/10/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit

@IBDesignable
class CardImage: UIImageView {
    @IBInspectable var cornerRadius: CGFloat = 2.0 //valor de las equinas a redondear
    @IBInspectable var borderWidth: CGFloat = 0 //Ancho del borde
    @IBInspectable var borderColor: CGColor = UIColor.black.cgColor //Color del borde
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor
        clipsToBounds = true //Permite recortar la imágen
    }
}
