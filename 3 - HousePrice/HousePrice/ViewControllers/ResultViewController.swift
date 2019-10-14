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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        closeButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 21.0)
        closeButton.titleLabel?.textColor = UIColor.darkGray
        closeButton.titleLabel?.text = "Nueva Estimación"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let parent = self.parent as? SelectDataViewController {
            /*print("""
                Tamaño de la casa: \(parent.houseSize)
                Estado de la casa: \(parent.houseCondition)
                Año de construcción: \(parent.constructionDate)
                Número de cuartos: \(parent.totalBedrooms)
                Número de baños: \(parent.totalBathrooms)
                Espacio de garage: \(parent.garagePlaces)
                """)*/
        }
    }
    
    @IBAction func newEstimationButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Recalculando", message: "Se está recalculando", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
}
