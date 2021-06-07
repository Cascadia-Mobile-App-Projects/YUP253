//
//  ListEventRow.swift
//  YUP253
//
//  Created by Student Account on 6/6/21.
//

import SwiftUI

struct ListEventRow: View {
    
    let thisEvent:Event
    
    init(theEvent:Event){
        thisEvent = theEvent
    }
    
    func noop(){}
    
    @EnvironmentObject var theDataRepo: DataRepository
    
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text("Event Name: \(thisEvent.eventName)")
                Text("Date: \(thisEvent.eventDate)")
            }
            Spacer()
            Button(action:noop){
                Text("Edit")
            }
        }
        .padding()
        .border(Color.black, width: 2)
    }
}

struct ListEventRow_Previews: PreviewProvider {
    static var previews: some View {
        let demoEvent = Event(id: UUID().hashValue, name: "E1", date: Date())
        ListEventRow(theEvent: demoEvent)
    }
}
