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
    
    var postImage: UIImageView!
    var titleTextField: UITextField!
    var textView: UITextView!
    var imagePicker: ImagePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
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
        
        if let title = self.titleTextField.text,
            let description = self.textView.text,
            let image = self.postImage.image {
            self.savePost(postUID: "\(uid)\(Date().description)", userUID: uid, title: title, description: description, image: image)
        }
    }
    
    func savePost(postUID: String, userUID: String, title: String, description: String, image: UIImage) {
        var imageData: Data?
        imageData = image.pngData()
        
        if let data = imageData {
            let imageName = postUID
            let ref = DatabaseService.shared.imageStorageRef.child("posts").child(imageName)
            _ = ref.putData(data, metadata: nil, completion: { (metadata, error) in
                if error != nil {
                    print("Error al subir la imagen")
                } else {
                    ref.downloadURL(completion: { (imageURL, error) in
                        if error != nil {
                            print("Error interno al subir la imagen: \(String(describing: error?.localizedDescription))")
                            return
                        }
                        
                        DispatchQueue.main.async {
                            let post = Post(title: title, userUID: userUID, postUID: postUID, photoURL: imageURL!, description: description, date: Date().description)
                            DatabaseService.shared.create(post: post, userUID: userUID)
                            DatabaseService.shared.savePictureRef(userUID: userUID, url: imageURL!, imageName: imageName)
                            NotificationCenter.default.post(name: NSNotification.Name("UpdateTableInfo"), object: nil)
                        }
                    })
                }
            })
            
        } else {
            print("No se pudo crear la imagegData o la url")
        }
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
            cell.mainImageView.image = #imageLiteral(resourceName: "placeholder")
            self.postImage = cell.mainImageView
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath) as! TextFieldTableViewCell
            cell.textField.text = ""
            self.titleTextField = cell.textField
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell", for: indexPath) as! TextViewTableViewCell
            cell.titleLabel.text = "Description"
            cell.textView.text = ""
            self.textView = cell.textView
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.imagePicker.present(from: self.view)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            let image = UIImage(named: "placeholder") ?? UIImage()
            return tableView.frame.width / image.cropRatio
        } else if indexPath.row == 1 {
            return 80.0
        } else {
            return 110.0
        }
    }
    
}

extension CreatePostTableViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        if image != nil {
            let indexPath = IndexPath(row: 0, section: 0)
            let cell = self.tableView.cellForRow(at: indexPath) as! ImageTableViewCell
            cell.mainImageView.image = image
            self.postImage.image = image
        }
    }
}
