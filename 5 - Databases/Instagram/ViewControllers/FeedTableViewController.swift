//
//  FeedTableViewController.swift
//  Instagram
//
//  Created by Moisés Córdova on 25/10/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseStorage

class FeedTableViewController: UITableViewController {
    
    var posts: [Post] = []
    
    let images: [UIImage] = [#imageLiteral(resourceName: "2"), #imageLiteral(resourceName: "3"), #imageLiteral(resourceName: "picture-2"), #imageLiteral(resourceName: "profile")]
    let titles = ["Imagination in the sky", "Call me queen bee", "", ""]
    let likes = ["936", "1352", "", ""]
    let comments = ["315", "515", "", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(getPosts), name: Notification.Name("UpdateTableInfo"), object: nil)
        self.getPosts()
    }
    
    
    @objc func getPosts() {
        DatabaseService.shared.postsRef.observeSingleEvent(of: .value) { (snapshot) in
            if let posts = snapshot.value as? Dictionary<String, AnyObject> {
                for value in posts.values {
                    if let post = value as? Dictionary<String, AnyObject> {
                        if let title = post["title"] as? String,
                            let photoURL = post["photoURL"] as? String,
                            let description = post["description"] as? String {
                            if let url = URL(string: photoURL) {
                                self.posts.append(Post(title: title, userUID: Auth.auth().currentUser!.uid, postUID: "", photoURL: url, description: description, date: Date().description))
                            }
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as! FeedTableViewCell
        let post = self.posts[indexPath.row]
        cell.titleLabel.text = post.title
        cell.pictureCardImage.downloadedFrom(url: post.photoURL)
        cell.likesLabel.text = "936"
        cell.commentsLabel.text = "315"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        /*let image = images[indexPath.row]
        return tableView.frame.width / image.cropRatio*/
        return UITableView.automaticDimension
    }
    
}
