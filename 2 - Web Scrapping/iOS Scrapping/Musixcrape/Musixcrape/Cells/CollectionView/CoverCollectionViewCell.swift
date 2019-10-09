//
//  CoverCollectionViewCell.swift
//  Musixcrape
//
//  Created by Moisés Córdova on 09/10/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit

class CoverCollectionViewCell: UICollectionViewCell { //Celda personalizada
    @IBOutlet var coverUIImageView: UIImageView!
    @IBOutlet var artistLabel: UILabel!
    @IBOutlet var songLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
}
