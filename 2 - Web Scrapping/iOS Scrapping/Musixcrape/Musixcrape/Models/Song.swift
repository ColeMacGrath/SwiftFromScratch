//
//  Song.swift
//  Musixcrape
//
//  Created by Moisés Córdova on 09/10/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import Foundation

class Song {
    private var _name: String
    private var _artist: String
    private var _album: String?
    private var _songURL: URL
    private var _imageURL: URL?
    private var _imageLink: String?
    private var _lyrics: String?
    
    init(name: String, artist: String, album: String? = nil, songURL: URL, imageLink: String? = nil, imageURL: URL? = nil) {
        _name = name
        _artist = artist
        _songURL = songURL
        _imageURL = imageURL
        _imageLink = imageLink
    }
    
    var name: String {
        set { _name = newValue  }
        get { return _name      }
    }
    
    var artist: String {
        set { _artist = newValue    }
        get { return _artist        }
    }
    
    var songURL: URL {
        set { _songURL = newValue   }
        get { return _songURL       }
    }
    
    var imageURL: URL? {
        set { _imageURL = newValue  }
        get { return _imageURL      }
    }
    
    var imageLink: String? {
        set { _imageLink = newValue }
        get { return _imageLink}
    }
    
    var lyrics: String? {
        set { _lyrics = newValue    }
        get { return _lyrics        }
    }
    
    var album: String? {
        set { _album = newValue }
        get { return _album     }
    }
}
