//
//  ListEventRow.swift
//  YUP253
//
//  Created by Student Account on 6/6/21.
//

import SwiftUI

struct ListEventRow: View {
    
    let permissions: Auth = AppSettings.shared().permissions
    let thisEvent:Event
    
    init(theEvent:Event){
        thisEvent = theEvent
    }
    
    func noop(){}
    
    @EnvironmentObject var theDataRepo: DataRepository
    
    func deleteEvent(){
        theDataRepo.deleteEvent(theEvent: thisEvent)
    }
    var body: some View {
        
        HStack{
            VStack(alignment: .leading) {
                Text("Event Name: \(thisEvent.eventName)")
                Text("Date: \(thisEvent.eventDate)")
            }
            Spacer()
            
            if (permissions.contains(.ModifyEvents)) {
            NavigationLink(destination: EditEvent(originalEvent: thisEvent)){
                Text("Edit Event").padding()
            }.padding()
                Button(action:deleteEvent) {
                    Text("Remove Event")
                }
            }
            else {
                NavigationLink(destination: loginView()){
                    Text("RSVP").padding()
                }.padding()
            }
        }
        .padding()
        .border(Color.black, width: 2)
    }
}

struct ListEventRow_Previews: PreviewProvider {
    static var previews: some View {
        let demoEvent = Event(id: UUID().hashValue, name: "DemoEvent", date: Date())
        ListEventRow(theEvent: demoEvent)
    }
}
