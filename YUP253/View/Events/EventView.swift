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

struct EventInfoRow: View {
    @EnvironmentObject var theDataRepo: DataRepository
    
    //var User = "User"
    var currUser = "Admin"
    
    let whichEvent: EventInfo
    
    @State private var ToggleUser = true
    
    var body: some View {
        HStack {
            Text("\(whichEvent.title)");
            Spacer()
            
            if (currUser == "Admin")
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
    }

struct EventView: View {
    @State private var selection: String? = nil
    
    let EventList = [
        EventInfo(title: "Meetup @ Madison Park 4/20/21"),
        EventInfo(title: "Meetup @ Stuart Park 5/1/21"),
        //EventInfo(title: "12+ Division Tournament 6/25/21"),
        //EventInfo(title: "Elite Division Game 6/26/21")
    ]
    
    var body: some View {
        NavigationView{
        VStack {

            
            //(Color(red: 0.002, green: 0.24, blue: 0.561))
            Text("Ultimate Events:").font(.title).foregroundColor(.white)
            
                Image("253")
            
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom)
                    .navigationBarTitle("EVENTS", displayMode: .inline)
            
            NavigationLink(destination: AddEvents()){
                Text("Add New Event")
                    .foregroundColor(.white)
            }.padding()
            
            
          List(EventList) { aEvent in
                EventInfoRow(whichEvent:aEvent)
            }
        
            
        }
        .padding(.top, 40)
        .background(LinearGradient(gradient: Gradient(colors: [Color.black, (Color(red: 0.022, green: 0.24, blue: 0.561))]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))

    }
    }
}


struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
            //.environmentObject(DataRepository(realm: try! Realm()))
    }
}
