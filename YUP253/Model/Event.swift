//  YUP253 Project
//
//  EventModel.swift
//
//  Created by Jason Lacy on 5/19/21
//

import Foundation
import RealmSwift

class Event: Object {
    @objc dynamic var id = 0
    @objc dynamic var eventName = ""
    @objc dynamic var eventDate = Date()
    
    convenience init(id: Int, name: String, date:Date) {
        self.init()
        self.id = id
        self.eventName = name
        self.eventDate = date
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
