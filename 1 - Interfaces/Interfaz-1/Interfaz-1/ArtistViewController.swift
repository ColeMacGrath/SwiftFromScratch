//
//  ArtistViewController.swift
//  Interfaz-1
//
//  Created by Moisés Córdova on 9/5/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit

class ArtistViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension ArtistViewController: UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //AlbumCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCell", for: indexPath) as! AlbumCollectionViewCell
        cell.albumImageView.image = #imageLiteral(resourceName: "album")
        cell.artistLabel.text = "Lindsey Stirling"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //SongCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as! SongTableViewCell
        cell.songLabel.text = "Song"
        cell.albumImageView.image = #imageLiteral(resourceName: "BraveEnougFrontal")
        cell.albumLabel.text = "Brave Enough"
        cell.timeLabel.text = "4:20"
        
        return cell
    }
    
}
