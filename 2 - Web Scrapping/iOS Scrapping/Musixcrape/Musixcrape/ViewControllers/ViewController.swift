//
//  ViewController.swift
//  Musixcrape
//
//  Created by Moisés Córdova on 09/10/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit
import Kanna
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var songFactory: SongFactory!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: Notification.Name("parsedPopular"), object: nil)
        songFactory = SongFactory(popularURL: "https://www.musixmatch.com")
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    @objc func reloadData() {
        self.collectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return songFactory.songs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "coverCell", for: indexPath) as! CoverCollectionViewCell
        let song = songFactory.songs[indexPath.row]
        cell.coverUIImageView.downloadedFrom(link: song.imageLink ?? "")
        cell.artistLabel.text = song.artist
        cell.songLabel.text = song.name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let SelectedSong = songFactory.songs[indexPath.row]
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "lyricsVC") as? LyricsViewController {
            viewController.song = SelectedSong
            viewController.modalPresentationStyle = .fullScreen
            present(viewController, animated: true)
        }
    }
}
