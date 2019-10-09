//
//  ViewController.swift
//  Scrapping
//
//  Created by Moisés Córdova on 10/1/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import Alamofire
import Kanna
import Cocoa

class ViewController: NSViewController {
    
    var urlString = "https://www.musixmatch.com/es/search/Let%20it%20be"

    override func viewDidLoad() {
        super.viewDidLoad()
        scrapeURL()
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func scrapeURL() {
        Alamofire.request(urlString).responseString { response in
            if let htmlString = response.result.value {
                //self.parseResultsPopular(html: htmlString)
                //self.parseSong(html: htmlString)
                self.parseResults(html: htmlString)
            }
        }
    }
    
    func parseSong(html: String) {
        do {
            let htmlDocument = try Kanna.HTML(html: html, encoding: .utf8)
            for span in htmlDocument.css("span") {
                if span["class"] == "lyrics__content__ok" {
                    print(span.text?.trim ?? "")
                }
            }
        } catch {
            print(error)
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
                                if li["class"] == "showArtist showCoverart" {
                                    for a in li.css("a") {
                                        if a["class"] == "title" {
                                            var link = "https://www.musixmatch.com"
                                            link += a["href"]?.trim ?? ""
                                            print(link)
                                            for span in a.css("span") {
                                                print(span.text?.trim ?? "")
                                            }
                                        }
                                        
                                        if a["class"] == "artist" {
                                            print(a.text?.trim ?? "")
                                        }
                                    }
                                }
                                
                                for div in li.css("div") {
                                    if div["class"] == "media-card-picture" {
                                        for img in div.css("img") {
                                            var imageLink = img["srcset"]?.trim ?? ""
                                            if let spaceRange = imageLink.range(of: " ") {
                                              imageLink.removeSubrange(spaceRange.lowerBound..<imageLink.endIndex)
                                                print(imageLink)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
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
                                if div["class"] == "cover-container" {
                                    var link = div["style"] ?? ""
                                    link.removeFirst(22)
                                    link.removeLast(2)
                                    print(link)
                                }
                                
                                if div["class"] == "track-info" {
                                    print("https://www.musixmatch.com\(a["href"] ?? "")")
                                    for span in div.css("span") {
                                        if span["class"] == "title" {
                                            print("Nombre de la canción: \(span.text?.trim ?? "")")
                                        }
                                        
                                        if span["class"] == "artist-name" {
                                            print("Nombre del artista: \(span.text?.trim ?? "")")
                                        }
                                    }
                                    
                                }
                            }
                        }
                    }
                }
            }
        } catch {
            print(error)
        }
    }

}

extension String {
    var trim: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
