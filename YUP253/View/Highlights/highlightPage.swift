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
                Spacer().padding()
                
                Image("253")
                
                
                VStack{
                    
                    Spacer()
                    
                    Spacer()
                    
            HStack{
                
                NavigationLink(destination: AddHighlight()) {
                    Text("Add")
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color(red: 0.022, green: 0.24, blue: 0.561))
                    
                    
                        
                    Spacer()
                    
                }
                    
                
                NavigationLink(destination: ListAllHighlights(whichMode:.List)) {
                    Text("View")
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color(red: 0.022, green: 0.24, blue: 0.561))
                    Spacer()
                }
                    
                
                NavigationLink(destination: ListAllHighlights(whichMode: .Update)) {
                    Text("Edit")
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color(red: 0.022, green: 0.24, blue: 0.561))
                    Spacer()
                    
    
                }
                    
                
                NavigationLink(destination: ListAllHighlights(whichMode: .Delete)) {
                    Text("Delete")
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color(red: 0.022, green: 0.24, blue: 0.561))
                    
                    Spacer()
                        
                    
                }
                    
                .edgesIgnoringSafeArea(.all)
                .navigationBarTitle("HIGHLIGHTS", displayMode: .inline)
                
                    
            }
                    
                }
            
        }
            
            .background(LinearGradient(gradient: Gradient(colors: [Color.black, (Color(red: 0.022, green: 0.24, blue: 0.561))]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
            
            
            
        }
        
            
            .environmentObject(DataRepository(realm: realmObj))
        .background(LinearGradient(gradient: Gradient(colors: [Color.black, (Color(red: 0.022, green: 0.24, blue: 0.561))]), startPoint: .leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing))
        
        
        
    }
    
}

struct highlightPage_Previews: PreviewProvider {
    static var previews: some View {
        highlightPage()
    }
}







