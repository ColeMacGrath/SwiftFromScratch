//
//  DatabaseService.swift
//  Instagram
//
//  Created by Moisés Córdova on 12/11/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage
import FirebaseAuth

class DatabaseService {
    private static let _shared = DatabaseService()
    
    static var shared: DatabaseService {
        return _shared
    }
    
    var mainRef: DatabaseReference {
        return Database.database().reference()
    }
    
    var usersRef: DatabaseReference {
        return mainRef.child("users")
    }
    
    var postsRef: DatabaseReference {
        return mainRef.child("posts")
    }
    
    var commentRef: DatabaseReference {
        return mainRef.child("comments")
    }
    
    var mainStorageRef: StorageReference {
        return Storage.storage().reference(forURL: "gs://jdksad")
    }
    
    var imageStorageRef: StorageReference {
        return mainStorageRef.child("images")
    }
    
    func create(user: User) {
        
        user.uid = Auth.auth().currentUser?.uid ?? ""
        
        let userDict: Dictionary<String, AnyObject> = [
            "name": user.name as AnyObject,
            "mail": user.email as AnyObject,
            "username": user.username as AnyObject
        ]
        self.usersRef.child(user.uid).child("profile").setValue(userDict)
    
    }
    
    
    func saveProfilePictureRef(userUID: String, url: URL) {
        let pictureRef: Dictionary<String, AnyObject> = [
            "profilePicture": url.absoluteString as AnyObject
        ]

        self.usersRef.child(userUID).child("profileURL").setValue(pictureRef)
    }
    
    func follow(userUID: String, followingUID: String) {
        self.usersRef.child(userUID).child("following").child(followingUID).setValue(followingUID)
    }
    
    func removeFollow(userUID: String, followUID: String) {
        self.usersRef.child(userUID).child("following").child(followUID).removeValue()
    }
    
    func create(post: Post, userUID: String) {
        let postDict: Dictionary<String, AnyObject> = [
            "userUID": userUID as AnyObject,
            "title": post.title as AnyObject,
            "description": post.description as AnyObject,
            "photoURL": post.photoURL.absoluteString as AnyObject
        ]
       
        self.postsRef.child(post.postUID).setValue(postDict)
        self.usersRef.child(userUID).child("posts").child(post.postUID).setValue(post.postUID)
    }
    
    func like(post: Post, userUID: String) {
        let likes: Int = post.likes + 1
        let postDict: Dictionary<String, AnyObject> = [
        "likes": likes as AnyObject
        ]
        
        self.postsRef.child(post.postUID).setValue(postDict)
    }
    
    func like(comment: Comment) {
        let likes: Int = comment.likes + 1
        let commentDict: Dictionary<String, AnyObject> = [
        "likes": likes as AnyObject
        ]
        self.commentRef.child(comment.UID).setValue(commentDict)
    }
    
    func comment(comment: Comment, postUID: String) {
        let commentDict: Dictionary<String, AnyObject> = [
            "UID": comment.UID as AnyObject,
            "userUID": comment.userUID as AnyObject,
            "content": comment.content as AnyObject,
            "date": comment.date as AnyObject,
            "likes": comment.likes as AnyObject
        ]
        
        self.commentRef.child(comment.UID).setValue(commentDict)
    }
    
}
