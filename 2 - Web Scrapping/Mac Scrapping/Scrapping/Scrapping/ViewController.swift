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
    
    var urlString = "https://www.musixmatch.com/es"

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
                self.parseResultsPopular(html: htmlString)
            }
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
