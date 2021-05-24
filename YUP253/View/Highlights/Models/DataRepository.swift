//
//  DataRepository.swift
//  YUP253
//
//  Created by Anton Tran on 5/23/21.
//

import Foundation
import RealmSwift

class DataRepository: ObservableObject {
    
    init(realm: Realm) {
       
    }
    
    func saveHighlight(newUser: String, newText: String) {
        objectWillChange.send()
        let realm = try! Realm()

        try! realm.write {
            let theHighlight = Highlight(id: UUID().hashValue, user: newUser, text: newText)
            realm.add(theHighlight)
        }
    }
    
    func loadHighlight() -> Results<Highlight> {
        let realm = try! Realm()
        return realm.objects(Highlight.self)
    }
    
    func findAHighlight(text: String) -> Highlight? {
        let realm = try! Realm()
        let results = realm.objects(Highlight.self).filter("text = " + text)
        if results.count != 1 {
            return nil
        } else {
            
            return results.map(Highlight.init)[0]
        }
    }
    
    func deleteHighlight(theHighlight: Highlight) {
        objectWillChange.send()

        do {
            // 3
            let realm = try Realm()
            let results = realm.objects(Highlight.self).filter( "id = " + String(theHighlight.id) + "  ")
            
            if results.count != 1 {
                return
            }

            try realm.write {
                // 4
                realm.delete(results[0])
            }
        } catch let error {
          // Handle error
          print(error.localizedDescription)
        }
    }
    
    func deleteAllHighlight() {
        objectWillChange.send()

        do {
            let realm = try Realm()
            try realm.write {
                realm.deleteAll()
            }
        } catch let error {
          // Handle error
          print(error.localizedDescription)
        }
    }
    
    func updateHighlight( id: Int, newUser:String, newText:String) {
        // 1
        objectWillChange.send()
        do {
          // 2
          let realm = try Realm()
          try realm.write {
            // 3
            realm.create(
              Highlight.self,
                value: ["id": id, "user": newUser, "text": newText],
              update: .modified)
          }
        } catch let error {
          // Handle error
          print(error.localizedDescription)
        }
    }
}
