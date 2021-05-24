//
//  Highlight.swift
//  YUP253
//
//  Created by Anton Tran on 5/23/21.
//

import Foundation
import RealmSwift

class Highlight: Object {
    @objc dynamic var id = 0
    @objc dynamic var user = ""
    @objc dynamic var text = ""
    convenience init(id: Int, user:String, text:String) {
        self.init() 
        self.id = id
        self.user = user
        self.text = text
        
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
