//
//  EventView.swift
//  YUP253
//
//  Created by Student Account on 4/21/21.
//

import SwiftUI

struct EventInfo : Identifiable {
    let id = UUID()
    let title: String
}

struct EventInfoRow: View {
    let whichEvent: EventInfo
    
    var body: some View {
        HStack {
            Text("Event Title:\n\(whichEvent.title)");
            Button() {

            }
            label: {
                Text("Sign UP")
                    .padding(20) .background(Color.blue)
            }
            .contentShape(Rectangle())
                
            }
        }
    }

struct EventView: View {
    
    let EventList = [
        EventInfo(title: "Meetup @ Madison Park 4/20/21"),
        EventInfo(title: "Meetup @ Stuart Park 5/1/21"),
        EventInfo(title: "12+ Division Tournament 6/25/21"),
        EventInfo(title: "Elite Division Game 6/26/21")
    ]
    
    var body: some View {
        VStack {
            Text("Ultimate Events:").font(.title)
            
            List(EventList) { aEvent in
                EventInfoRow(whichEvent:aEvent)
            }
        }
        
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
    }
}
