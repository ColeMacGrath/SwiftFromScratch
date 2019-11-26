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
        
        guard Auth.auth().currentUser != nil else {
            guard let viewController = storyboard?.instantiateViewController(withIdentifier: "LoginVC") else { return }
            viewController.modalPresentationStyle = .fullScreen
            present(viewController, animated: true)
            return
        }
        
        performSegue(withIdentifier: "showMainNC", sender: nil)
        
    }
}
