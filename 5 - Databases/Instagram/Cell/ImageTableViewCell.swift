//
//  ImageTableViewCell.swift
//  Instagram
//
//  Created by Moisés Córdova on 28/10/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    var mainImageView: UIImageView = {
        var imageView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var imageViewHeight = NSLayoutConstraint()
    var imageRatioWidth = CGFloat()
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(mainImageView)
        mainImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        mainImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    
}
