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

struct EventView: View {
    var settings: AppSettings = AppSettings.shared()
    @State private var selection: String? = nil
    @EnvironmentObject var theDataRepo: DataRepository
    
    var body: some View {
        ZStack(alignment: .top){
        NavigationView{
            VStack() {

            let auth : Auth = settings.permissions
            //(Color(red: 0.002, green: 0.24, blue: 0.561))
                Text("Ultimate Events:").font(.title).foregroundColor(.white)
                    .navigationBarTitle("EVENTS", displayMode: .inline)
            Spacer()
            
            if (auth.contains(.ModifyEvents)) {
                NavigationLink(destination: AddEvents()){
                    Text("Add New Event")
                        .foregroundColor(.white)
                }.padding()
            }
            
            ScrollView(.vertical) {
                ForEach(self.theDataRepo.loadEvents().map(Event.init),
                        id: \.self) {
                        aEvent in ListEventRow(theEvent: aEvent)
                }
            }
            Spacer()
            
        }
        .padding(.top, 10)
        .background(LinearGradient(gradient: Gradient(colors: [Color.black, (Color(red: 0.022, green: 0.24, blue: 0.561))]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
            }
        }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
            .padding(-15)
            .foregroundColor(.primary)
            .environmentObject(DataRepository(realm: try! Realm()))
    }
}
