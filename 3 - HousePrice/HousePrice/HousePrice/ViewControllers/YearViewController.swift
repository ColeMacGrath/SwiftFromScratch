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
    
    override func viewWillDisappear(_ animated: Bool) {
        _ = setInformation()
    }
    
    func setInformation() -> SelectDataViewController? {
        guard let parent = self.parent as? SelectDataViewController else { return nil }
        let year = Calendar.current.component(.year, from: datePicker.date)
        parent.constructionDate = year
        return parent
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        setInformation()?.nextPage()
    }
}
