//
//  Comment.swift
//  Instagram
//
//  Created by Moisés Córdova on 12/11/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import Foundation

class Comment {
    
    var UID: String
    var userUID: String
    var content: String
    var date: String
    var likes: Int
    
    init(UID: String, userUID: String, content: String, date: String, likes: Int = 0) {
        self.UID = UID
        self.userUID = userUID
        self.content = content
        self.date = date
        self.likes = likes
    }
}
