//
//  Util.swift
//  BabyListener
//
//  Created by Moisés Córdova on 21/10/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var firstColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var secondColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var isHorizontal: Bool = true {
        didSet {
            updateView()
        }
    }
    
    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    
    func updateView() {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [firstColor, secondColor].map {$0.cgColor}
        if (isHorizontal) {
            layer.startPoint = CGPoint(x: 0, y: 0.5)
            layer.endPoint = CGPoint (x: 1, y: 0.5)
        } else {
            layer.startPoint = CGPoint(x: 0.5, y: 0)
            layer.endPoint = CGPoint (x: 0.5, y: 1)
        }
    }
    
}

@IBDesignable
class CardView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 2
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 3
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0.5
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
    }
    
    func changeStatus(recording: Bool, statusLabel: UILabel) {
        if #available(iOS 11, *) {
            UIView.animate(withDuration: 0.3, animations: {
            }, completion: { _ in
                UIView.animate(withDuration: 0.3, animations: {
                    if recording {
                        self.layer.cornerRadius = 0.0
                        self.layer.backgroundColor = #colorLiteral(red: 0.499281466, green: 0.3708473444, blue: 0.9076929688, alpha: 1)
                        statusLabel.text = "Grabando"
                    } else {
                        self.layer.cornerRadius = 40.0
                        self.layer.backgroundColor = #colorLiteral(red: 0.9490324855, green: 0.2772545815, blue: 0.4238913059, alpha: 1)
                        statusLabel.text = "Presiona para grabar"
                    }
                })
            })
        }
    }
    
}
