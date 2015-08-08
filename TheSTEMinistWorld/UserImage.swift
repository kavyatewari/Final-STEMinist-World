//
//  File.swift
//  TheSTEMinistWorld
//
//  Created by Kavya on 8/5/15.
//  Copyright (c) 2015 Kavya Tewari. All rights reserved.
//

import Foundation
import RealmSwift

class UserImage: Object {
    dynamic var image: NSData = NSData()
    dynamic var tag = 0
//    dynamic var scienceTag = 0
//    dynamic var techTag = 1
//    dynamic var engineeringTag = 2
//    dynamic var mathTag = 3
    func setUserImage(image: UIImage) {
        self.image = UIImagePNGRepresentation(image)
    }
    func getImage() -> NSData {
        return image
    }
    
//    func setTag() {
//        
//    }
//    
//    func getTag() {                                                                                                                                                                                                                                                             
//        
//    }
    
}
