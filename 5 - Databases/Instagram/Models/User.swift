//
//  User.swift
//  Instagram
//
//  Created by Moisés Córdova on 12/11/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import Foundation

class User {
    var uid: String
    var name: String
    var photoURL: URL?
    var username: String
    var email: String
    var posts: [Post] = []
    
    init(uid: String, name: String, username: String, email: String, photoURL: URL? = nil) {
        self.uid = uid
        self.name = name
        self.username = username
        self.email = email
        self.photoURL = photoURL
    }
    
}
