//
//  EventView.swift
//  YUP253
//
//  Created by Student Account on 4/21/21.
//

import SwiftUI
import RealmSwift

struct EventInfo : Identifiable {
    let id = UUID()
    let title: String
}

/*struct EventInfoRow: View {
    @EnvironmentObject var theDataRepo: DataRepository
    private let thisEvent:Event
    
    init(theEvent:Event) {
        thisEvent = theEvent
    }
    
    //var User = "User"
    var currUser = "Admin"
    
    //let whichEvent: EventInfo
    
    @State private var ToggleUser = true
    
    var body: some View {
        HStack {
            //Text("\(whichEvent.title)");
            Text("Name: \(thisEvent.eventName)")
            Text("Name: \(thisEvent.eventDate)")
            Spacer()
            
            if (currUser != "Admin")
            {
                    NavigationLink(destination: EditEvent()){
                        Text("Edit Event").padding()
                    }.padding()
            }
            else
            {
                Button() {}
                    label: {
                    Text("Sign Up")
                        .padding(15)
                        .background(Color.blue)
                        
                }
                .contentShape(Rectangle())
            }
            
            }
        }
    }*/

struct EventView: View {
    @State private var selection: String? = nil
    
    @EnvironmentObject var theDataRepo: DataRepository
    
    var body: some View {
        NavigationView{
        VStack {

            let currUser = "Admin"
            //(Color(red: 0.002, green: 0.24, blue: 0.561))
            Text("Ultimate Events:").font(.title).foregroundColor(.white)
            
                Image("253")
            
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom)
                    .navigationBarTitle("EVENTS", displayMode: .inline)
            if (currUser == "Admin") {
                
                NavigationLink(destination: AddEvents()){
                    Text("Add New Event")
                        .foregroundColor(.black)
                }.padding()
            }
            
            ScrollView(.vertical) {
                ForEach(self.theDataRepo.loadEvents().map(Event.init),
                        id: \.self) {
                        aEvent in ListEventRow(theEvent: aEvent)
                }
            }
        }
        .padding(.top, 40)
        //.background(LinearGradient(gradient: Gradient(colors: [Color.black, (Color(red: 0.022, green: 0.24, blue: 0.561))]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
    }
    }
}


struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
            .environmentObject(DataRepository(realm: try! Realm()))
    }
}
