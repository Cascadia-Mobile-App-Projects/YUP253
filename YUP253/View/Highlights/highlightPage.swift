//
//  highlightPage.swift
//  YUP253
//
//  Created by Anton Tran on 5/5/21.
//

import SwiftUI

struct highlightPage: View {
    var body: some View {
        
        ZStack{
            
            Color.blue.ignoresSafeArea()
            
            VStack{
                
                Text("Highlight")
                    .padding()
                    .background(Color.white)
                Spacer()
                
            
                
                VStack(alignment: .leading){
                    
                    Spacer()
                    
                    Label("Walter White", systemImage: "person.crop.circle")
                    Image("frisbee1")
                    .resizable()
                    .frame(width: 256.0, height: 128.0)
                    
                    Label("John Cena", systemImage: "person.crop.circle")
                    Image("frisbee2")
                    .resizable()
                    .frame(width: 256.0, height: 128.0)
                    Spacer()
                    Spacer()
                }
                
            }
            
            
            
            
            
            
            
        }
        
        
        
        
        
}
}

struct highlightPage_Previews: PreviewProvider {
    static var previews: some View {
        highlightPage()
    }
}
