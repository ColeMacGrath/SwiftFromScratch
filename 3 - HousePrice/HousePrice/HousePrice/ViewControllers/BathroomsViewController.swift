//
//  BathroomsViewController.swift
//  HousePrice
//
//  Created by Moisés Córdova on 14/10/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit

class BathroomsViewController: UIViewController {

    @IBOutlet weak var quantityTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        _ = setInformation()
    }
    
    func setInformation() -> SelectDataViewController? {
        guard let parent = self.parent as? SelectDataViewController else { return nil }
        guard let total = Int(quantityTextField.text!) else { return nil }
        parent.totalBathrooms = total
        return parent
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        var quantity = quantityTextField.text!
        if sender.tag != 10 {
            quantity += String(sender.tag)
            quantityTextField.text = quantity
        } else {
            setInformation()?.nextPage()
        }
    }
}
