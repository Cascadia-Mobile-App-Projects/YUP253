//
//  Highlights.swift
//  YUP253
//
//  Created by Anton Tran on 4/26/21.
//

import SwiftUI

struct Highlights: View {
    var body: some View {
        ZStack {
                   Color.blue
                   .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center){
                Text("Highlights")
                    .background(Color.white)
                Spacer()
                    .frame(height: 500)
                
            }
            VStack(alignment: .leading) {
                
                
                
                Spacer()
                    .frame(height: 100)
                
                Label("Walter White", systemImage: "person.crop.circle")
                Image("frisbee1").resizable()
                    .scaledToFit()
                
                Spacer()
                    .frame(height: 10)
            
                Label("Abraham Lincoln", systemImage: "person.crop.circle")
                Image("frisbee2").resizable()
                    .scaledToFit()
                
                
                    

                
                
                        
            
                .contentShape(Rectangle())
                Spacer()
                
            }
            .padding()
            
               }
       
        
        
        
    }
}

struct Highlights_Previews: PreviewProvider {
    static var previews: some View {
        Highlights()
    }
}
