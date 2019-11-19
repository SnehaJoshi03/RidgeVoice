//
//  Announcement.swift
//  RidgeVoice
//
//  Created by Sneha Joshi on 7/14/19.
//  Copyright © 2019 Sneha Joshi. All rights reserved.
//

import Foundation
import RealmSwift

class Announcement: Object {
    
    @objc dynamic var id : String?
    @objc dynamic var message : String?
    @objc dynamic var messageDesc : String?
    @objc dynamic var user : User?
    @objc dynamic var timeStamp: String?
    @objc dynamic var dateValue : String?
    
    override public static func primaryKey() -> String? {
        return "id"
    }
    
    func writeToRealm() {
        try! serviceRealm.write {
            serviceRealm.add(self, update: Realm.UpdatePolicy.modified)
        }
    }
    
    public func dictionaryRepresentation() -> NSDictionary {
        let dictionary = NSMutableDictionary()
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.message, forKey: "message")
         dictionary.setValue(self.messageDesc, forKey: "messageDesc")
        dictionary.setValue(self.dateValue, forKey: "dateValue")
        dictionary.setValue(self.user?.dictionaryRepresentation(), forKey: "user")
        dictionary.setValue(self.timeStamp, forKey: "timeStamp")
        return dictionary
    }
    
 }
