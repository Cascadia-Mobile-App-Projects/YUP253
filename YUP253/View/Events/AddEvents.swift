//
//  AddEvents.swift
//  YUP253
//
//  Created by Student Account on 5/14/21.
//

import SwiftUI

struct AddEvents: View {
    
    @State var EventName: String = ""
    @State var EventDate: String = ""
    
    //@EnvironmentObject var theDataRepo: DataRepository
    
    func showFormElts() {
        print("showFormElts")
        print("Event: \(EventName)")
        print("Event Date: \(EventDate)")
    }
    
    func saveNewEvent() {
        //Save logic needed
        if (self.EventName.isEmpty) {
            print("Event Name Empty")
            return
        }
        if (self.EventDate.isEmpty) {
            print("Event Date Empty")
            return
        }
        
        
        //For Debugging, show user input
        showFormElts()
        
        
        // Return to previous screen
        self.presentationMode.wrappedValue.dismiss()
    }
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("New Event Info:")) {
                    TextField("Event Name or Location", text: $EventName)
                    TextField("Event Date", text: $EventDate)
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
