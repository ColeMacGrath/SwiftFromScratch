//
//  ResultViewController.swift
//  HousePrice
//
//  Created by Moisés Córdova on 14/10/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var closeButton: CardButton!
    let model = HousePriceModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        closeButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 21.0)
        closeButton.titleLabel?.textColor = UIColor.darkGray
        closeButton.titleLabel?.text = "Nueva Estimación"
    }
    	
    override func viewDidAppear(_ animated: Bool) {
        if let parent = self.parent as? SelectDataViewController {
            var stringValue = ""
            do {
                let prediction = try model.prediction(bathrooms: Double(parent.totalBathrooms), cars: Double(parent.garagePlaces), condition: Double(parent.houseCondition), rooms: Double(parent.totalBedrooms), size: Double(parent.houseSize), yearBuilt: Double(parent.constructionDate))
                let formatter = NumberFormatter()
                formatter.numberStyle = .currency
                formatter.maximumFractionDigits = 0
                stringValue = formatter.string(from: prediction.value as NSNumber) ?? "N/A"
            } catch {
                print(error.localizedDescription)
            }
            
            resultLabel.text = stringValue
        }
    }
    
    @IBAction func newEstimationButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
