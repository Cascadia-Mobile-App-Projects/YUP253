//
//  EditEvent.swift
//  YUP253
//
//  Created by Student Account on 5/19/21.
//

import SwiftUI

struct EditEvent: View {
    @State var showAlert = false
    @State var EventName: String = ""
    @State var selectedDate = Date()
    
    private var original: Event = Event()
    
    init () {}
    
    init(originalEvent OE: Event) {
        self.init()
        original = OE
        EventName = OE.eventName
        selectedDate = OE.eventDate
    }
    
    @EnvironmentObject var theDataRepo: DataRepository
    
    let format = DateFormatter()
    
    func noop() {}

    @Environment(\.presentationMode) var presentationMode:
        Binding<PresentationMode>
    
    //Need to call update method from DB Object
    func updateEventinDB() {
        
        guard !(self.EventName.isEmpty) else {
            print("Event Name Empty")
            return
        }
        
        format.timeZone = .current
        format.dateFormat = "yyyy-MM-dd '' h:mm a"
        let dateString = format.string(from: selectedDate)
        
        print("OE name: \(original.eventName)")
        print("showUpdateEventInfo")
        print("Event: \(EventName)")
        print("Event Date: \(dateString)")
        
        theDataRepo.updateEvent(id: self.original.id, newEventName: self.EventName, newEventDate: self.selectedDate)
        
        self.presentationMode.wrappedValue.dismiss()
    }
    
    var body: some View {
        NavigationView {
            Form {
                //Need to add calls to get Original Event info and display
                Section(header: Text(self.original.eventName + "'s New Info:")) {
                    TextField("Name: ", text: $EventName).foregroundColor(.black)
                    DatePicker("Date/Time", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
                }
                
                Button("Update Event"){
                    showAlert = true
                }.alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Update Event?"),
                        primaryButton: .default(Text("Yes"), action: updateEventinDB),
                        secondaryButton: .cancel()
                        )
                }
            }
            .navigationBarTitle("Update Event Info")
        }

    }
}

struct EditEvent_Previews: PreviewProvider {
    static var previews: some View {
        EditEvent()
    }
}
