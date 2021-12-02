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
    let format = DateFormatter()
    @EnvironmentObject var theDataRepo: DataRepository
    
    func dateformatter() -> String{
        format.timeZone = .current
        format.dateFormat = "yyyy-MM-dd '' h:mm a"
        let dateString = format.string(from: thisEvent.eventDate)
        print("Test format: \(dateString)")
        return dateString;
    }
    
    func deleteEvent(){
        theDataRepo.deleteEvent(theEvent: thisEvent)
    }
    
    var body: some View {
        return HStack{
            VStack(alignment: .leading) {
                Text("\(thisEvent.eventName)").padding(.bottom, 1)
                Text("\(thisEvent.eventLocation)").padding(.bottom, 1)
                Text("\(self.dateformatter())")
            }
            .foregroundColor(ColoredText.color)
            Spacer()
            
            if (permissions.contains(.ModifyEvents)) {
            NavigationLink(destination: EditEvent(originalEvent: thisEvent)){
                Text("Edit Event").padding()
            }.padding()
                Button(action:deleteEvent) {
                    Text("Remove Event")
                }
            }
        }
        .padding()
        .border(Color.black, width: 2)
    }
}

struct ListEventRow_Previews: PreviewProvider {
    static var previews: some View {
        let demoEvent = Event(id: UUID().hashValue, name: "DemoEvent", date: Date(), location: "School")
        ListEventRow(theEvent: demoEvent)
    }
}
