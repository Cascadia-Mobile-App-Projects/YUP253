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
            Image("yupbackground").ignoresSafeArea()
            
            
            
            VStack{
                
                Spacer()
                
                Text("Highlights")
                
                
                    VStack(alignment: .leading){
                        Label("Walter White", systemImage: "person.crop.circle")
                        Image("frisbee1")
                            .resizable()
                                .frame(width: 256.0, height: 128.0)
                        
                    }
                
                    
                    
                    
                    VStack(alignment: .leading){
                        Label("Jackie Chan", systemImage: "person.crop.circle")
                        Image("frisbee2")
                            .resizable()
                                .frame(width: 256.0, height: 128.0)
                    }
               
                Spacer()
                
                
                
                
                
                
                    
                
                
            }
        }
    }
}

struct highlightPage_Previews: PreviewProvider {
    static var previews: some View {
        highlightPage()
    }
}
