//
//  FeedTableViewCell.swift
//  Instagram
//
//  Created by Moisés Córdova on 25/10/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var pictureCardImage: CardImage!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var commentImageView: UIImageView!
    @IBOutlet weak var commentsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.favoriteImageView.image = #imageLiteral(resourceName: "favorite-icon")
        self.commentImageView.image = #imageLiteral(resourceName: "comment-icon")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
