//
//  FeedTableViewController.swift
//  Instagram
//
//  Created by Moisés Córdova on 25/10/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit
import FirebaseAuth

class FeedTableViewController: UITableViewController {
    
    let images: [UIImage] = [#imageLiteral(resourceName: "2"), #imageLiteral(resourceName: "3"), #imageLiteral(resourceName: "picture-2"), #imageLiteral(resourceName: "profile")]
    let titles = ["Imagination in the sky", "Call me queen bee", "", ""]
    let likes = ["936", "1352", "", ""]
    let comments = ["315", "515", "", ""]

    override func viewDidLoad() {
        super.viewDidLoad()
            getPosts()
    }
    
    
    func getPosts() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        DatabaseService.shared.postsRef.observeSingleEvent(of: .value) { (snapshot) in
            
            for dict in snapshot.value as? Array<Dictionary<String, AnyObject>> ?? Array() {
                guard let myDict = dict as? Dictionary<String, AnyObject> else { return }
                    
                   if let title = myDict["title"] as? String,
                    let description = dict["description"] as? String {
                        print(title)
                        print(description)
                    }
                }
            }
            
            
    }

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
