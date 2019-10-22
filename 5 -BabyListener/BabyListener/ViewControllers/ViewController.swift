//
//  ViewController.swift
//  BabyListener
//
//  Created by Moisés Córdova on 21/10/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var buttonCardView: CardView!
    @IBOutlet weak var statusLabel: UILabel!
    var recordStatus: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = ""
        recordStatus = false
    }


    @IBAction func cardButtonPressed(_ sender: UITapGestureRecognizer) {
        recordStatus = recordStatus ? false : true
        buttonCardView.changeStatus(recording: recordStatus, statusLabel: statusLabel)
    }
}
