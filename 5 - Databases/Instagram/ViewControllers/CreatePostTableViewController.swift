//
//  CreatePostTableViewController.swift
//  Instagram
//
//  Created by Moisés Córdova on 26/10/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit

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
        let alert = UIAlertController(title: "Posted", message: "You've been posted a photo", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (alert) in
            self.navigationController?.popViewController(animated: true)
        }))
        present(alert, animated: true)
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
            
            return cell
        } else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath) as! TextFieldTableViewCell
            cell.textField.text = "Wait for it..."
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
