//
//  PostTableViewController.swift
//  Instagram
//
//  Created by Moisés Córdova on 25/10/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit

class PostTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PictureCell", for: indexPath) as! FeedTableViewCell
            cell.pictureCardImage.image = #imageLiteral(resourceName: "2")
            cell.likesLabel.text = "985"
            cell.commentsLabel.text = "315"
            cell.titleLabel.text = "Imagination in the sky"
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell", for: indexPath) as! DescriptionTableViewCell
            cell.descriptionTextView.text = "Before every show we say a team prayer and I always ask that people in our audience will feel loved. Above everything else, that’s what my religion has taught me; that we are meant to love one another. If differences, standards, beliefs, or commandments take us away from love rather than closer to it."
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as! CommentTableViewCell
            cell.profileCardImage.image = #imageLiteral(resourceName: "picture-3")
            cell.commentLabel.text = "Consistent presentation 🤟"
            cell.dateLabel.text = "Just Now"
            cell.nameLAbel.text = "Gig Haddid"
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as? ProfileViewController else { return }
        self.navigationController?.show(viewController, sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height: CGFloat = 100.0
        
        if indexPath.row == 0 {
            let image = #imageLiteral(resourceName: "2")
            height = tableView.frame.width / image.cropRatio
        }
        
        if indexPath.row == 1 {
            height = 200.0
        }
        
        return height
    }
    
}
