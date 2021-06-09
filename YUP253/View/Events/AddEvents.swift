//
//  AddEvents.swift
//  YUP253
//
//  Created by Student Account on 5/14/21.
//

import SwiftUI
import RealmSwift

struct AddEvents: View {
    
    @State var EventName: String = ""
    @State var selectedDate = Date()
    @State var showAlert = false
    
    @EnvironmentObject var theDataRepo: DataRepository
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let format = DateFormatter()
    
    func saveNewEvent() {

        if (self.EventName.isEmpty) {
            print("Event Name Empty")
            return
        }
        format.timeZone = .current
        format.dateFormat = "yyyy-MM-dd '' h:mm a"
        let dateString = format.string(from: selectedDate)
        
        print("showFormElts")
        print("Event: \(EventName)")
        print("Event Date: \(dateString)")

        //Logic to save EventName and selectedDate to DB
        //
        theDataRepo.saveEvent(newEventName: self.EventName, newEventDate: self.selectedDate)
        
        // Return to previous screen
        self.presentationMode.wrappedValue.dismiss()
    }
    

    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("New Event Info:")) {
                    TextField("Event Name or Location", text: $EventName).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    DatePicker("Date/Time", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
                }
                
                Button("Add Event"){
                    showAlert = true
                }.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Add New Event?"),
                        primaryButton: .default(Text("Yes"), action: saveNewEvent),
                        secondaryButton:
                            .cancel()
                        )
                    
                }
                
            }
            .navigationBarTitle("Add New Event Form")
        }
    }
}

struct AddEvents_Previews: PreviewProvider {
    //repo code
    //placeholder repo
    static var previews: some View {
        AddEvents()
    }
}
