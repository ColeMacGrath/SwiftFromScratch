//
//  FeedTableViewController.swift
//  Instagram
//
//  Created by Moisés Córdova on 25/10/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit

class FeedTableViewController: UITableViewController {
    
    let images: [UIImage] = [#imageLiteral(resourceName: "2"), #imageLiteral(resourceName: "3"), #imageLiteral(resourceName: "picture-2"), #imageLiteral(resourceName: "profile")]
    let titles = ["Imagination in the sky", "Call me queen bee", "", ""]
    let likes = ["936", "1352", "", ""]
    let comments = ["315", "515", "", ""]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //10.214.8.38
    //10.214.8.1

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as! FeedTableViewCell
        cell.titleLabel.text = titles[indexPath.row]
        cell.pictureCardImage.image = images[indexPath.row]
        cell.likesLabel.text = likes[indexPath.row]
        cell.commentsLabel.text = comments[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let image = images[indexPath.row]
        return tableView.frame.width / image.cropRatio
    }

}
