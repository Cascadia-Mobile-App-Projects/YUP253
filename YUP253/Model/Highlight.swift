//
//  Highlight.swift
//  YUP253
//
//  Created by Anton Tran on 5/23/21.
//

import Foundation
import RealmSwift
import SwiftUI

class Highlight: Object {
    @objc dynamic var id = 0
    @objc dynamic var text = ""
    dynamic var image: UIImage?
    
    
    
    
    convenience init(id: Int, text:String, image:UIImage?) {
        self.init()
        self.id = id
        self.text = text
        self.image = image
        
        
        
        
        
        
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
