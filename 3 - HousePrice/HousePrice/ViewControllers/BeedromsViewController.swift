//
//  BeedromsViewController.swift
//  HousePrice
//
//  Created by Moisés Córdova on 14/10/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit

class BeedromsViewController: UIViewController {

    @IBOutlet weak var quantityTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func doneButtonPressed(_ sender: UIButton) {
        var quantity = quantityTextField.text!
        
        if sender.tag != 10 {
            quantity += String(sender.tag)
            quantityTextField.text = quantity
        } else {
            guard let parent = self.parent as? SelectDataViewController else { return }
            if let total = Int(quantity) {
                parent.totalBedrooms = total
            }
        }
        
    }
    
}
