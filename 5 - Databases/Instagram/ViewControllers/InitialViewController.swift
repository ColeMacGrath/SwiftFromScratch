//
//  InitialViewController.swift
//  Instagram
//
//  Created by Moisés Córdova on 03/11/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    
    var activeSession = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AuthService.shared.register(email: "email@email.com", password: "gfdfds32", onComplete: { (message, data) in
            guard message == nil else {
                //error: message
                return //Si se llega aquí se sale de la función y no se envía a la pantalla principal
            }
            
            let alert = UIAlertController(title: "OK", message: "User successfully registered", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            
            //mostrar pantalla principal
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if activeSession {
            performSegue(withIdentifier: "showMainNC", sender: nil)
        } else {
            guard let viewController = storyboard?.instantiateViewController(withIdentifier: "LoginVC") else { return }
            viewController.modalPresentationStyle = .fullScreen
            present(viewController, animated: true)
        }
    }
}
