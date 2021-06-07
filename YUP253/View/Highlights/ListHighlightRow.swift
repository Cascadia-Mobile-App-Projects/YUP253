//
//  ListHighlightRow.swift
//  YUP253
//
//  Created by Anton Tran on 5/23/21.
//

import SwiftUI

struct ListHighlightRow: View {
    
    var mode: HighlightListMode
    
    
    private let thisHighlight:Highlight
    
    init(theHighlight:Highlight, mode:HighlightListMode) {
        thisHighlight = theHighlight
        self.mode = mode
    }
    
   
    func noop() {
        
    }
    
    
    @EnvironmentObject var theDataRepo: DataRepository
    
    func deleteHighlightFromDB() {
        theDataRepo.deleteHighlight(theHighlight: thisHighlight)
        
    }
    
    // To dismiss the screen:
    // https://stackoverflow.com/a/57279591/250610
   
    
    var body: some View {
        HStack {
            
            
            VStack(alignment: .leading) {
                
                
                    
                    
                    
                    
                    
                    
                    VStack{
                        HStack{
                            Image("profile")
                                .resizable()
                                .frame(width: 32.0, height: 32.0)
                            
                            Text("John Cena:")
                            Text("\(thisHighlight.text)")
                        }
                        
                        
                        Image("frisbee1")
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .frame(width: 150, height: 150)
                    }
                    
                        
                    
                    

                    
                    
                    
                    
                    
                
                
                
                
            }
            Spacer()
            if mode == .Add {
                Button(action:noop) {
                    Text("Edit")
                }
            }
            else if mode == .Update {
                NavigationLink(destination: UpdateHighlight(originalHighlight:thisHighlight)) {
                    Text("Edit")
                }
            }
            else if mode == .Delete {
                
                Button(action:deleteHighlightFromDB) {
                    Text("Delete")
                    
                }
                
                
            }
        }
        .padding()
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
    }
}

//struct ListHighlightRow_Previews: PreviewProvider {
//
//
//    static var previews: some View {
//        let demoHighlight = Highlight(id: UUID().hashValue, text: "Fred", img:)
//
//        ListHighlightRow(theHighlight: demoHighlight, mode: .Update)
//    }
//}
