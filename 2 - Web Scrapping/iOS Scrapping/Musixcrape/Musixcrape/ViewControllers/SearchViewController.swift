//
//  SearchViewController.swift
//  Musixcrape
//
//  Created by Moisés Córdova on 09/10/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResultsNV" {
            if let navigationController = segue.destination as? UINavigationController {
                if let viewController = navigationController.topViewController as? ResultsViewController {
                    viewController.searchParameter = searchTextField.text
                }
            }
        }
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "showResultsNV", sender: nil)
    }
    
}
