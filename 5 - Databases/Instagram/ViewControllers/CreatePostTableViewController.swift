//
//  CreatePostTableViewController.swift
//  Instagram
//
//  Created by Moisés Córdova on 26/10/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit
import FirebaseAuth

class CreatePostTableViewController: UITableViewController {
    
    var postImage: UIImage!
    var postTitle: String!
    var postDescription: String!
    var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 44.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.titleView?.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationItem.titleView?.isHidden = false
    }
    
    @IBAction func postButtonPressed(_ sender: UIBarButtonItem) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let post = Post(title: "postTitle", userUID: "uid", postUID: "\(uid)\(Date().description)", photoURL: URL(string: "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwjgq-2MhfflAhUSA6wKHd8VBSkQjRx6BAgBEAQ&url=%2Furl%3Fsa%3Di%26rct%3Dj%26q%3D%26esrc%3Ds%26source%3Dimages%26cd%3D%26ved%3D%26url%3Dhttps%253A%252F%252Fwww.wired.com%252Fstory%252Fstay-in-the-moment-take-a-picture%252F%26psig%3DAOvVaw03omEe1f1M6Fr1lC2uq0vT%26ust%3D1574279151497907&psig=AOvVaw03omEe1f1M6Fr1lC2uq0vT&ust=1574279151497907")!, description: "postDescription", date: Date().description)
        
        DatabaseService.shared.create(post: post, userUID: uid)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageTableViewCell
            cell.mainImageView.image = #imageLiteral(resourceName: "profile")
            self.postImage = cell.mainImageView.image
            return cell
        } else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath) as! TextFieldTableViewCell
            cell.textField.text = "Wait for it..."
            self.postTitle = cell.textField.text
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell", for: indexPath) as! TextViewTableViewCell
            cell.titleLabel.text = "Description"
            cell.textView.text = "...I do all my own stunts. I was testing an effect that I wanted to do in my show... let’s just say it didn’t make it in the show."
            self.textView = cell.textView
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            let image = #imageLiteral(resourceName: "profile")
            return tableView.frame.width / image.cropRatio
        } else if indexPath.row == 1 {
            return 80.0
        } else {
            return 110.0
        }
    }

}
