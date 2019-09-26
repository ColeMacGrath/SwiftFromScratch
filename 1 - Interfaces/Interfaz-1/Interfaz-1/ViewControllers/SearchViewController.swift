//
//  SearchViewController.swift
//  Design2
//
//  Created by Moisés Córdova on 9/24/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResultsNV" { //Si el segue tiene se nombre se ejecuta lo siguiente
            if let navigationController = segue.destination as? UINavigationController { // Si el ddestino del segue es un UINavigationController se crea una constante llama navigationController
                if let viewController = navigationController.topViewController as? ResultsViewController { // Si el primer controlador del navigationController es puede ser casteado a ResultsViewController se transferirá el resultado de la barra de búsqueda hacia la variable serachParameter contenida en el ResultsViewController
                    viewController.searchParameter = searchTextField.text
                }
            }
        }
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "showResultsNV", sender: nil) //Ejecutamos al segue que lleva de una vista a otra
    }
    

}
