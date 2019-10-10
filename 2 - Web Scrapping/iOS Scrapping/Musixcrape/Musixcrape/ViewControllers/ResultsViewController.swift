//
//  ResultsViewController.swift
//  Musixcrape
//
//  Created by Moisés Córdova on 09/10/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var searchParameter: String!
    var songFactory: SongFactory!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: Notification.Name("SongDownloaded"), object: nil)
        self.title = searchParameter
        let link = searchParameter.replacingOccurrences(of: " ", with: "%20")
        let searchLink = "https://www.musixmatch.com/es/search/\(link)"
        self.songFactory = SongFactory(songsURL: searchLink)
    }
    
    @objc func reloadData() {
        self.tableView.reloadData()
    }

}

extension ResultsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.songFactory.songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath) as! SearchTableViewCell
        let song = songFactory.songs[indexPath.row]
        if let URL = song.imageURL {
            cell.albumImageView.downloadedFrom(url: URL)
        }
        cell.songLabel.text = song.name
        cell.artistLabel.text = song.artist
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedSong = songFactory.songs[indexPath.row]
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "lyricsVC") as? LyricsViewController {
            viewController.song = selectedSong
            viewController.modalPresentationStyle = .fullScreen
            present(viewController, animated: true)
        }
    }
    
}
