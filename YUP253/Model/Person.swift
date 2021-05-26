//  YUP 253 Project
//
//  PersonModel.swift
//
//  Created by Jason Lacy on 5/22/21.
//

import Foundation
import RealmSwift

class Person: Object {
    @objc dynamic var id = 0
    @objc dynamic var username = ""
    @objc dynamic var fName = ""
    @objc dynamic var lName = ""
    @objc dynamic var age = 0
    @objc dynamic var phNum = 0
    @objc dynamic var email = ""
    
    
    convenience init(id: Int, username:String, fName: String, lName: String, age: Int, phNum: Int, email: String) {
        self.init()
        self.id = id
        self.username = ""
        self.fName = ""
        self.lName = ""
        self.age = 0
        self.phNum = 0
        self.email = ""
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
