//
//  YearViewController.swift
//  HousePrice
//
//  Created by Moisés Córdova on 14/10/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit

class YearViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        let year = Calendar.current.component(.year, from: datePicker.date)
        
        guard let parent = self.parent as? SelectDataViewController else { return }
        parent.constructionDate = year
    }
}
