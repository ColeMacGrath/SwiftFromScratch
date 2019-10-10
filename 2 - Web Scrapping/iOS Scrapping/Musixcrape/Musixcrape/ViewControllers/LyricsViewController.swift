//
//  LyricsViewController.swift
//  Musixcrape
//
//  Created by Moisés Córdova on 09/10/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import UIKit
import Kanna
import Alamofire

class LyricsViewController: UIViewController {

    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var lyricsTextView: UITextView!
    @IBOutlet weak var doneButton: UIButton!
    var song: Song!
    var songFactory: SongFactory!
    //lyricsVC
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.navigationController == nil {
            doneButton.isHidden = false
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(setData), name: Notification.Name("updatedSong"), object: nil)
        songFactory = SongFactory(songURL: song!.songURL.absoluteString, song: song)
    }
    
    @objc func setData() {
        song = songFactory.singleSong
        if let imageURL = song.imageURL {
            albumImageView.downloadedFrom(url: imageURL)
        }
        songLabel.text = song.name
        artistLabel.text = song.artist
        lyricsTextView.text = song.lyrics ?? "Imposible to charge"
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
