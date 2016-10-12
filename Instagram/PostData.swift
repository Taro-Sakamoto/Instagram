//
//  PostData.swift
//  Instagram
//
//  Created by Taro Sakamoto on 9/30/16.
//  Copyright © 2016 Tarou Sakamoto. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class PostData: NSObject {
    var id: String?
    var image: UIImage?
    var imageString: String?
    var name: String?
    var caption: String?
    var date: NSDate?
    var likes: [String] = []
    var isLiked: Bool = false
    var comment: String!
    var comments: [[String:String]] = []

    
    init(snapshot: FIRDataSnapshot, myId: String) {
        id = snapshot.key
        
        let valueDictionary = snapshot.value as! [String: AnyObject]
        
        imageString = valueDictionary["image"] as? String
        image = UIImage(data: NSData(base64EncodedString: imageString!, options: .IgnoreUnknownCharacters)!)
        
        name = valueDictionary["name"] as? String
        
        caption = valueDictionary["caption"] as? String
        
        // snapshotからコメント取り出し
        if let comments = valueDictionary["comments"] as? [[String:String]] {
            self.comments = comments

        }
        if let likes = valueDictionary["likes"] as? [String] {
            self.likes = likes
        
        
        
        
        }
        
        for likeId in likes {
            if likeId == myId {
                isLiked = true
                break
            }
        }
        
        self.date = NSDate(timeIntervalSinceReferenceDate: valueDictionary["time"] as! NSTimeInterval)
  
    
    // [onishi]
    if let comments = valueDictionary["comments"] as? [[String:String]] {
        self.comments = comments
    }
    }
    
}