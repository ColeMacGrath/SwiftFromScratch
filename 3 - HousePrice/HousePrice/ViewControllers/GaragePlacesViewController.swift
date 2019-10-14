//
//  GaragePlacesViewController.swift
//  HousePrice
//
//  Created by Moisés Córdova on 14/10/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit

class GaragePlacesViewController: UIViewController {

    @IBOutlet weak var totalTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        guard var total = totalTextField.text else { return }
        
        if sender.tag != 10 {
            total += String(sender.tag)
            totalTextField.text = total
        } else {
            guard let parent = self.parent as? SelectDataViewController else { return }
            if let total = Int(total) {
                parent.garagePlaces = total
            }
        }
        
    }

}
