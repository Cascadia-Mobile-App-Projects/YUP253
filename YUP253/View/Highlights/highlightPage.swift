//
//  highlightPage.swift
//  YUP253
//
//  Created by Anton Tran on 5/5/21.
//



import SwiftUI
import RealmSwift

struct highlightPage: View {
    
    let realmObj: Realm
    
    init() {
        do {
          realmObj = try Realm()
        } catch let error {
          // Handle error
            fatalError("Failed to open Realm. Error: \(error.localizedDescription)")
        }
    }
    
    var body: some View {
    
        NavigationView {
            
            VStack{
                
                
                Text("Highlight")
                    .bold()
                    .font(.title)
                Image("253")
                
                
                VStack{
                    Spacer()
                    
                    
            HStack{
                
                NavigationLink(destination: AddHighlight()) {
                    Text("Add")
                        .padding()
                        .background(Color.green)
                    Spacer()
                    
                }
                    
                
                NavigationLink(destination: ListAllHighlights(whichMode:.List)) {
                    Text("View")
                        .padding()
                        .background(Color.green)
                    Spacer()
                }
                    
                
                NavigationLink(destination: ListAllHighlights(whichMode: .Update)) {
                    Text("Edit")
                        .padding()
                        .background(Color.green)
                    Spacer()
    
                }
                    
                
                NavigationLink(destination: ListAllHighlights(whichMode: .Delete)) {
                    Text("Delete")
                        .padding()
                        .background(Color.green)
                    Spacer()
                }
                    
                
                
                    
            }
                }
            
        }
            
            
        }
            .padding()
            .environmentObject(DataRepository(realm: realmObj))
    }
}

struct highlightPage_Previews: PreviewProvider {
    static var previews: some View {
        highlightPage()
    }
}







