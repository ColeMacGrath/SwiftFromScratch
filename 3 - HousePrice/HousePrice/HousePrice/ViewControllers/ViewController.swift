//
//  ViewController.swift
//  HousePrice
//
//  Created by Moisés Córdova on 13/10/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "showPageVC", sender: nil)
    }

}
