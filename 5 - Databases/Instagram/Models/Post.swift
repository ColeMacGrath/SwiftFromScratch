//
//  Post.swift
//  Instagram
//
//  Created by Moisés Córdova on 12/11/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import Foundation

class Post {
    var userUID: String
    var postUID: String
    var photoURL: URL
    var description: String
    var date: String
    var likes: Int
    var title: String
    
    init(title: String, userUID: String, postUID: String, photoURL: URL, description: String, date: String, likes: Int = 0) {
        self.userUID = userUID
        self.postUID = postUID
        self.photoURL = photoURL
        self.description = description
        self.date = date
        self.likes = likes
        self.title = title
    }
}
