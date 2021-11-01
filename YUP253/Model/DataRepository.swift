//  YUP253 Project
//
//  DataRepo.swift
//
//  Created by Jason Lacy on 5/19/21
//

import Foundation
import RealmSwift
import SwiftUI

class DataRepository: ObservableObject {
    
    init(realm: Realm) {
    }
    
    func saveEvent(newEventName: String, newEventDate: Date) {
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
            let realm = try Realm()
            let results = realm.objects(Event.self).filter( "id = " + String(theEvent.id) + "  ")
            
            if results.count != 1 {
                return
            }

            try realm.write {
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
    
    func updateEvent( id: Int, newEventName:String, newEventDate:Date) {
        objectWillChange.send()
        do {
          let realm = try! Realm()
          try! realm.write {
              
              //let theEvent = Event(id: UUID().hashValue, name: newEventName, date: newEventDate)
              //realm.add(theEvent)
            realm.create(
              Event.self,
                value: ["id": id, "eventName": newEventName, "eventDate": newEventDate],
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
    
    func saveProfilePic() {
        
    }
    
    func loadProfilePic() {
        
    }
    
    func savePerson(pUserName: String, pFName: String, pPassword: String, pLName: String, pAge: String, pNum: String, pEmail: String) {
            objectWillChange.send()
            let realm = try! Realm()

            try! realm.write {
                let newPerson = Person(id: UUID().hashValue, username: pUserName, password: pPassword, fName: pFName, lName: pLName, age: pAge, phNum: pNum, email: pEmail)
                realm.add(newPerson)
            }
        }
        
        func loadPerson() -> Results<Person> {
            let realm = try! Realm()
            return realm.objects(Person.self)
        }
        
        func findPerson(personName: String) -> Person? {
            let realm = try! Realm()
            let results = realm.objects(Person.self).filter("User = " + personName)
            if results.count != 1 {
                return nil
            } else {
                return results.map(Person.init)[0]
            }
        }
        
        func deletePerson(thePerson: Person) {
            objectWillChange.send()

            do {
                let realm = try Realm()
                let results = realm.objects(Person.self).filter( "id = " + String(thePerson.id) + "  ")
                
                if results.count != 1 {
                    return
                }

                try realm.write {
                    realm.delete(results[0])
                }
            } catch let error {
              // Handle error
              print(error.localizedDescription)
            }
        }
        
    func updatePerson(id: Int, newUserName: String, newPassword: String, newFName: String, newLName: String, newAge: String, newNum: String, newEmail: String) {
            objectWillChange.send()
            do {
              let realm = try Realm()
              try realm.write {
                realm.create(
                  Person.self,
                    value: ["id": id, "username": newUserName, "fName": newFName, "lName": newLName, "age": newAge, "phNum": newNum, "email": newEmail],
                  update: .modified)
              }
            } catch let error {
              // Handle error
              print(error.localizedDescription)
            }
        }
}
