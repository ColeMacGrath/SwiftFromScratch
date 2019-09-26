//
//  ResultsViewController.swift
//  Design2
//
//  Created by Moisés Córdova on 9/24/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var searchParameter: String! // Variable a ser asginada a partir de la información obtenida en el controlador pasado

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = searchParameter // Se asigna el título a partir de la variable asiganada en el controlador pasado
        // Do any additional setup after loading the view.
    }
    
    

}

extension ResultsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath) as! SearchTableViewCell
        cell.albumImageView.image = #imageLiteral(resourceName: "albumCover")
        cell.songLabel.text = "Song"
        cell.artistLabel.text = "Artist"
        
        return cell
    }
    
    
}
