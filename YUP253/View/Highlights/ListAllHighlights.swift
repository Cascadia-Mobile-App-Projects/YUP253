//
//  ListAllHighlights.swift
//  YUP253
//
//  Created by Anton Tran on 5/23/21.
//

import SwiftUI
import RealmSwift

struct ListAllHighlights: View {
    @EnvironmentObject var theDataRepo: DataRepository
    var whichMode: HighlightListMode
    
    var body: some View {
        VStack {
            Text("Highlight")
            
            // to add a scroll bar:
            // https://www.hackingwithswift.com/books/ios-swiftui/how-scrollview-lets-us-work-with-scrolling-data
            ScrollView(.vertical) {
                ForEach(self.theDataRepo.loadHighlight().map(Highlight.init), id: \.self) { aHighlight in
                    ListHighlightRow(theHighlight: aHighlight, mode:whichMode)
                }
            }
            
            if (whichMode == .Delete){
            
            NavigationLink(destination: ClearDB()) {
                Text("Clear All")
                Spacer()
                
            }
            }
        }
    }
}

struct ListAllHighlights_Previews: PreviewProvider {
    static var previews: some View {
        ListAllHighlights(whichMode: .List)
            .environmentObject(DataRepository(realm: try! Realm()))
    }
}
