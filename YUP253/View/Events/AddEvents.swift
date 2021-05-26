//
//  AddEvents.swift
//  YUP253
//
//  Created by Student Account on 5/14/21.
//

import SwiftUI

struct AddEvents: View {
    
    @State var EventName: String = ""
    @State private var selectedDate = Date()
    //var dateString = ""
    
    //@EnvironmentObject var theDataRepo: DataRepository
    let format = DateFormatter()

    func showFormElts() {
        print("showFormElts")
        print("Event: \(EventName)")
        //print("Event Date: \(dateString)")
    }
    
    func saveNewEvent() {

        if (self.EventName.isEmpty) {
            print("Event Name Empty")
            return
        }
        format.timeZone = .current
        format.dateFormat = "yyyy-MM-dd '' HH:mm"
        let dateString = format.string(from: selectedDate)
        
        //For Debugging, show user input
        showFormElts()
        print("Event Date: \(dateString)")

        //Logic to save EventName and selectedDate to DB needed
        //
        //
        //
        
        // Return to previous screen
        self.presentationMode.wrappedValue.dismiss()
    }
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("New Event Info:")) {
                    TextField("Event Name or Location", text: $EventName)
                    //TextField("Event Date", text: $EventDate)
                    DatePicker("Date/Time", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
                        //.environment(\.timeZone, TimeZone(secondsFromGMT: 2*60*60)!)
                }
                Button(action: saveNewEvent)
                {
                    Text("Click to Add Event")
                }
            }
            .navigationBarTitle("Add New Event Form")
        }
    }
}

struct AddEvents_Previews: PreviewProvider {
    static var previews: some View {
        AddEvents()
    }
}
