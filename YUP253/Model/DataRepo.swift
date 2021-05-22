//  YUP253 Project
//
//  DataRepo.swift
//
//  Created by Jason Lacy on 5/19/21
//

import Foundation
import RealmSwift

class DataRepository: ObservableObject {
    
    func saveEvent(newEventName: String, newEventDate: Int) {
        objectWillChange.send()
        let realm = try! Realm()

        try! realm.write {
            let newEvent = Event(id: UUID().hashValue, name: newEventName, date: newEventDate)
            realm.add(newEvent)
        }
    }
    
    func loadEvents() -> Results<Event> {
        let realm = try! Realm()
        return realm.objects(Event.self)
    }
    
    func deleteEvent(theEvent: Event) {
        objectWillChange.send()

        do {
            // 3
            let realm = try Realm()
            let results = realm.objects(Event.self).filter( "id = " + String(theEvent.id) + "  ")
            
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
    
    func deleteAllEvents() {
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
    
    func updateEvent( id: Int, newEventName:String, newEventDate:Int) {
        objectWillChange.send()
        do {
          let realm = try Realm()
          try realm.write {
            realm.create(
              Event.self,
                value: ["id": id, "name": newEventName, "date": newEventDate],
              update: .modified)
          }
        } catch let error {
          // Handle error
          print(error.localizedDescription)
        }
    }
        
    //--------------------------------
    //Functions for Person data models
    //--------------------------------
    
        func savePerson(newPersonF: String, newPersonL: Int) {
            objectWillChange.send()
            let realm = try! Realm()

            try! realm.write {
                let newEvent = Event(id: UUID().hashValue, name: newPersonName, date: newEventDate)
                realm.add(newEvent)
            }
        }
        
        func loadPerson() -> Results<Event> {
            let realm = try! Realm()
            return realm.objects(Event.self)
        }
        
        func findPerson(eventName: String) -> Event? {
            let realm = try! Realm()
            let results = realm.objects(Event.self).filter("Event = " + eventName)
            if results.count != 1 {
                return nil
            } else {
                // return a 'normal' Dog object, not a Realm Results thingee
                // call the initializer / constructor on the 1 thing in the Results using map
                // remember that .map returns an array
                // so get element 0, the one and only thing in the array
                // then return that
                return results.map(Event.init)[0]
            }
        }
        
        func deletePerson(theEvent: Event) {
            objectWillChange.send()

            do {
                // 3
                let realm = try Realm()
                let results = realm.objects(Event.self).filter( "id = " + String(theEvent.id) + "  ")
                
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
        
        func deleteAllPerson() {
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
        
        func updatePerson( id: Int, newPersonName:String, newEventDate:Int) {
            // 1
            objectWillChange.send()
            do {
              // 2
              let realm = try Realm()
              try realm.write {
                // 3
                realm.create(
                  Event.self,
                    value: ["id": id, "name": newEventName, "age": newEventDate],
                  update: .modified)
              }
            } catch let error {
              // Handle error
              print(error.localizedDescription)
            }
        }
    }
