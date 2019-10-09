//
//  SearchTableViewCell.swift
//  Musixcrape
//
//  Created by Moisés Córdova on 09/10/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet var albumImageView: UIImageView!
    @IBOutlet var songLabel: UILabel!
    @IBOutlet var artistLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
