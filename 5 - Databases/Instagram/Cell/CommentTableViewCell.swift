//
//  CommentTableViewCell.swift
//  Instagram
//
//  Created by Moisés Córdova on 25/10/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var profileCardImage: CardImage!
    @IBOutlet weak var nameLAbel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
