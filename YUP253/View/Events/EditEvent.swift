//
//  EditEvent.swift
//  YUP253
//
//  Created by Student Account on 5/19/21.
//

import SwiftUI

struct EditEvent: View {
    
    @State var EventName: String = ""
    @State var EventDate: String = ""
    
    func noop() {}
    //Mock code for Event Into read from DB
    /*private var original: Event = Event()
    
    init () {}
    
    init(originalEvent origEvent: Event) {
        self.init()
        original = origEvent
        EventName = origEvent.name
        EventDate = origEvent.date
    }*/
 
    func showFormElts() {
        print("showFormElts")
        print("Updated Event Name: \(EventName)")
        print("Updated Event Date: \(EventDate)")
    }
    
    @Environment(\.presentationMode) var presentationMode:
        Binding<PresentationMode>
    
    //Need to call update method from DB Object
    /*func updateEventinDB() {
        guard Int (self.EventDate) != nil else {
        print("Date was not a number")
        return
     }
     
     showFormElts()*/
    
    var body: some View {
        NavigationView {
            Form {
                //Need to add calls to get Original Event info and display
                Section(header: Text("New Info")) {
                    TextField("Name:", text:self.$EventName)
                    TextField("Event Date:", text:self.$EventDate)
                }
                Button(action: noop)
                {
                    Text("Update Event")
                }
                Spacer()
                Button(action: noop)
                {
                    Text("Delete this Event")
                }
            }
            .navigationBarTitle("Update/Delete Event")
        }

    }
}

struct EditEvent_Previews: PreviewProvider {
    static var previews: some View {
        EditEvent()
    }
}