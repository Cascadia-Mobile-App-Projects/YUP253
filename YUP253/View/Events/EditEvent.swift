//
//  EditEvent.swift
//  YUP253
//
//  Created by Student Account on 5/19/21.
//

import SwiftUI

struct EditEvent: View {
    
    @State var EventName: String = ""
    @State private var selectedDate = Date()
    
    let format = DateFormatter()
    
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
        print("Updated Event Date: \(selectedDate)")
    }
    
    @Environment(\.presentationMode) var presentationMode:
        Binding<PresentationMode>
    
    //Need to call update method from DB Object
    func updateEventinDB() {
        format.timeZone = .current
        format.dateFormat = "yyyy-MM-dd '' HH:mm"
        let dateString = format.string(from: selectedDate)
        
        print("showFormElts")
        print("Event: \(EventName)")
        print("Event Date: \(dateString)")
        
        
        //guard Int (self.EventDate) != nil else {
        //print("Date was not a number")
        return
    }
    
    var body: some View {
        NavigationView {
            Form {
                //Need to add calls to get Original Event info and display
                Section(header: Text("New Info")) {
                    TextField("Name:", text:self.$EventName)
                    DatePicker("Date/Time", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
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
