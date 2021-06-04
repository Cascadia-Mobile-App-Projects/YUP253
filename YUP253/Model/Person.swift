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
    @objc dynamic var pasword = ""
    @objc dynamic var fName = ""
    @objc dynamic var lName = ""
    @objc dynamic var age = ""
    @objc dynamic var phNum = ""
    @objc dynamic var email = ""
    
    
    convenience init(id: Int, username:String, password: String, fName: String, lName: String, age: String, phNum: String, email: String) {
        self.init()
        self.id = id
        self.username = ""
        self.fName = ""
        self.lName = ""
        self.age = ""
        self.phNum = ""
        self.email = ""
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
