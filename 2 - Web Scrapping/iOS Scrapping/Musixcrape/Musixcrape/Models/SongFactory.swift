//
//  SongFactory.swift
//  Musixcrape
//
//  Created by Moisés Córdova on 09/10/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import Foundation
import Alamofire
import Kanna

class SongFactory {
    private var _songs = [Song]()
    private var _singleSong: Song?
    private var _songURL: String
    private var _songsURL: String
    private var _popularURL: String
    
    init(songsURL: String) {
        _songsURL = songsURL
        _songURL = ""
        _popularURL = ""
        scrapeURL()
    }
    
    init(songURL: String, song: Song) {
        _songURL = songURL
        _songsURL = ""
        _popularURL = ""
        _singleSong = song
        scrapeURL()
    }
    
    init(popularURL: String) {
        _songURL = ""
        _songsURL = ""
        _popularURL = popularURL
        scrapeURL()
    }
    
    var singleSong: Song? { return _singleSong  }
    var songs: [Song] { return _songs}
    
    private func scrapeURL() {
        var url = ""
        if _songURL  != "" {
            url = _songURL
        } else if _songsURL != "" {
            url = _songsURL
        } else {
            url = _popularURL
        }
        
        Alamofire.request(url).responseString { response in
            if response.result.isSuccess {
                if let htmlString = response.result.value {
                    if self._songURL != "" {
                        self.parseSong(html: htmlString)
                    } else if self._songsURL != "" {
                        self.parseResults(html: htmlString)
                    } else {
                        self.parseResultsPopular(html: htmlString)
                    }
                }
            }
        }
    }
    
    func parseResults(html: String) {
        do {
            let htmlDocument = try Kanna.HTML(html: html, encoding: .utf8)
            for div in htmlDocument.css("div") {
                if div["class"] == "box-content" {
                    for ul in div.css("ul") {
                        if ul["class"] == "tracks list" {
                            for li in ul.css("li") {
                                var songName = ""
                                var songLink = ""
                                var artistName = ""
                                var imageSongLink = ""
                                
                                if li["class"] == "showArtist showCoverart" {
                                    for a in li.css("a") {
                                        if a["class"] == "title" {
                                            var link = "https://www.musixmatch.com"
                                            link += a["href"]?.trim ?? ""
                                            songLink = link
                                            //print(link)
                                            for span in a.css("span") {
                                                songName = span.text?.trim ?? ""
                                                //print(span.text?.trim ?? "")
                                            }
                                        }
                                        
                                        if a["class"] == "artist" {
                                            artistName = a.text?.trim ?? ""
                                            //print(a.text?.trim ?? "")
                                        }
                                    }
                                }
                                
                                for div in li.css("div") {
                                    if div["class"] == "media-card-picture" {
                                        for img in div.css("img") {
                                            var imageLink = img["srcset"]?.trim ?? ""
                                            if let spaceRange = imageLink.range(of: " ") {
                                              imageLink.removeSubrange(spaceRange.lowerBound..<imageLink.endIndex)
                                              imageSongLink = imageLink
                                                //print(imageLink)
                                            }
                                        }
                                    }
                                }
                                if let songURL = URL(string: songLink) {
                                    if let imageURL = URL(string: imageSongLink) {
                                        self._songs.append(Song(name: songName, artist: artistName, songURL: songURL, imageURL: imageURL))
                                    }
                                }
                            }
                        }
                    }
                }
            }
            NotificationCenter.default.post(name: NSNotification.Name("SongDownloaded"), object: nil)
        } catch {
            print(error)
        }
    }
    
    func parseResultsPopular(html: String) {
        do {
            let htmlDocument = try Kanna.HTML(html: html, encoding: .utf8)
            for ul in htmlDocument.css("ul") {
                if ul["class"] == "mui-collection mui-collection--grid desktop-track-collection mui-collection--medium" {
                    for a in ul.css("a") {
                        if a["class"] == "mui-cell mui-cell--sm" {
                            for div in a.css("div") {
                                var songLink = ""
                                var songImageLink = ""
                                var songName = ""
                                var artistName = ""
                                
                                if div["class"] == "cover-container" {
                                    var link = div["style"] ?? ""
                                    link.removeFirst(22)
                                    link.removeLast(2)
                                    songImageLink = link
                                }
                                
                                if div["class"] == "track-info" {
                                    songLink = "https://www.musixmatch.com\(a["href"] ?? "")"
                                    for span in div.css("span") {
                                        if span["class"] == "title" {
                                            songName = span.text?.trim ?? ""
                                        }
                                        
                                        if span["class"] == "artist-name" {
                                            artistName = span.text?.trim ?? ""
                                        }
                                    }
                                    
                                }
                                
                                
                                if let songURL = URL(string: songLink) {
                                    self._songs.append(Song(name: songName, artist: artistName, album: nil, songURL: songURL, imageLink: songImageLink, imageURL: nil))
                                }
                            }
                        }
                    }
                }
            }
            NotificationCenter.default.post(name: NSNotification.Name("parsedPopular"), object: nil)
        } catch {
            print(error)
        }
    }
    
    func parseSong(html: String) {
        do {
            let htmlDocument = try Kanna.HTML(html: html, encoding: .utf8)
            for span in htmlDocument.css("span") {
                if span["class"] == "lyrics__content__ok" {
                    _singleSong?.lyrics = span.text?.trim
                }
            }
            
            for div in htmlDocument.css("div") {
                if div["class"] == "banner-album-image-desktop" {
                    for img in div.css("img") {
                        if let URL = URL(string: img["src"] ?? "") {
                            _singleSong?.imageURL = URL
                        }
                    }
                }
            }
            NotificationCenter.default.post(name: NSNotification.Name("updatedSong"), object: nil)
        } catch {
            print(error)
        }
    }
}
