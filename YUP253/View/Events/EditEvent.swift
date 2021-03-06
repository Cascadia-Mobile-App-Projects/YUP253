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
    @State var EventLocation: String = ""
    
    private var original: Event = Event()
    
    init () {}
    
    init(originalEvent OE: Event) {
        self.init()
        original = OE
        EventName = OE.eventName
        selectedDate = OE.eventDate
        EventLocation = OE.eventLocation
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
        print("Location: \(EventLocation)")
        
        theDataRepo.updateEvent(id: self.original.id, newEventName: self.EventName, newEventDate: self.selectedDate, newEventLocation: EventLocation)
        
        self.presentationMode.wrappedValue.dismiss()
    }
    
    var body: some View {
        NavigationView {
            Form {
                //Need to add calls to get Original Event info and display
                Section(header: Text(self.original.eventName + "'s New Info:").foregroundColor(.blue)) {
                    TextField("Name: ", text: $EventName).foregroundColor(.blue)
                    TextField("Location: ", text: $EventLocation).foregroundColor(.blue)
                    DatePicker("Date/Time", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute]).foregroundColor(.blue)
                }
                
                Button("Update Event"){
                    showAlert = true
                }.foregroundColor(.blue).alert(isPresented: $showAlert) {
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
