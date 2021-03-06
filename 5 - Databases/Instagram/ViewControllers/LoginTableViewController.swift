//
//  LoginTableViewController.swift
//  Instagram
//
//  Created by Moisés Córdova on 03/11/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit

class LoginTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderImageCell", for: indexPath) as! HeaderTableViewCell
            cell.iconImageView.image = #imageLiteral(resourceName: "app-icon")
            cell.titleLabel.text = "Welcome"
            cell.subtitleLabel.text = "sign to continue"
            return cell
        case 1, 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as! TextFieldTableViewCell
            if indexPath.row == 1 {
                cell.textField.placeholder = "Type your mail"
                cell.textField.keyboardType = .emailAddress
            } else {
                cell.textField.placeholder = "Type your password"
                cell.textField.isSecureTextEntry = true
            }
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell", for: indexPath)
            cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 20.0)
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.textColor = UIColor.darkGray
            cell.textLabel?.center = self.view.center
            
            if indexPath.row == 3 {
                cell.textLabel?.text = "Login →"
            } else {
                cell.textLabel?.text = "Register"
            }
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 150.0
        } else {
            return 60.0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 3 {
            guard let navigationController = storyboard?.instantiateViewController(withIdentifier: "MainVC") else { return }
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: true)
        } else if indexPath.row == 4 {
            performSegue(withIdentifier: "ShowRegisterVC", sender: nil)
        }
    }

}
