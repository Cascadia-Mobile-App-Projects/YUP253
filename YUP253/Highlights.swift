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
            
            VStack(alignment: .center) {
                
                
        
                Text("Highlights")
                Spacer()
                
                Image("ic_253")

                
                Spacer()
                        
            
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
