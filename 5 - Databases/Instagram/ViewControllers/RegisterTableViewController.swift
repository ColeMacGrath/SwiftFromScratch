//
//  RegisterTableViewController.swift
//  Instagram
//
//  Created by Moisés Córdova on 03/11/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit

class RegisterTableViewController: UITableViewController {
    
    var emailTextField: UITextField!
    var passwordField: UITextField!
    var usernameField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderImageCell", for: indexPath) as! HeaderTableViewCell
            cell.iconImageView.image = #imageLiteral(resourceName: "app-icon")
            cell.titleLabel.text = "Welcome"
            cell.subtitleLabel.text = "register to continue"
            return cell
        case 1, 2, 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as! TextFieldTableViewCell
            if indexPath.row == 1 {
                cell.textField.placeholder = "Enter your username"
                self.usernameField = cell.textField
            } else if indexPath.row == 2 {
                cell.textField.placeholder = "Type your mail"
                cell.textField.keyboardType = .emailAddress
                self.emailTextField = cell.textField
            } else {
                cell.textField.placeholder = "Type your password"
                cell.textField.isSecureTextEntry = true
                self.passwordField = cell.textField
            }
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell", for: indexPath)
            cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 20.0)
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.textColor = UIColor.darkGray
            cell.textLabel?.center = self.view.center
            
            if indexPath.row == 4 {
                cell.textLabel?.text = "Register"
            } else {
                cell.textLabel?.text = "I've an existent account"
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
        if indexPath.row == 4 {
            AuthService.shared.register(email: emailTextField.text ?? "", password: passwordField.text ?? "", onComplete: { (message, data) in
                guard message == nil else {
                    let alert = UIAlertController(title: "Error found", message: message, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true)
                    return
                }
                
                //mostrar pantalla principal
                guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") else { return }
                viewController.modalPresentationStyle = .fullScreen
                self.present(viewController, animated: true)
                
            })
            
            
            
        } else if indexPath.row == 5 {
            dismiss(animated: true, completion: nil)
        }
    }

}
