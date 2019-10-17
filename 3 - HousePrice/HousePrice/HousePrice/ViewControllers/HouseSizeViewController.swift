//
//  HouseSizeViewController.swift
//  HousePrice
//
//  Created by Moisés Córdova on 14/10/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit

class HouseSizeViewController: UIViewController {

    @IBOutlet weak var sizeTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        _ = setInformation()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        var size = sizeTextField.text!
        if sender.tag != 10 {
            size += String(sender.tag)
            sizeTextField.text = size
        } else {
            setInformation()?.nextPage()
        }
    }
    
    func setInformation() -> SelectDataViewController? {
        guard let parent = self.parent as? SelectDataViewController else { return nil }
        guard let total = Int(sizeTextField.text!) else { return nil }
        parent.houseSize = total
        return parent
    }

}
