//
//  InitialViewController.swift
//  Instagram
//
//  Created by Moisés Córdova on 03/11/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit
import FirebaseAuth

class InitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "LoginVC") else { return }
        viewController.modalPresentationStyle = .fullScreen
        
        /*if Auth.auth().currentUser == nil {
            guard let viewController = storyboard?.instantiateViewController(withIdentifier: "LoginVC") else { return }
            viewController.modalPresentationStyle = .fullScreen
            present(viewController, animated: true)
        } else {
            performSegue(withIdentifier: "showMainNC", sender: nil)
        }*/
        
    }
}
