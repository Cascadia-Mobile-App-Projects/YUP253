//
//  highlightPage.swift
//  YUP253
//
//  Created by Anton Tran on 5/5/21.
//

import SwiftUI

struct highlightPage: View {
    @State private var selection: String? = nil
    
    var body: some View {
        
        NavigationView {
        
        ZStack{
            
            (LinearGradient(gradient: Gradient(colors: [Color.black, (Color(red: 0.022, green: 0.24, blue: 0.561))]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))

            
            VStack{
                Image("253")
                    
                    .aspectRatio(contentMode: .fit)
                
                
                Spacer()
                
            
                
                VStack(alignment: .leading){
                    
                    Spacer()
                    
                    Label("Walter White", systemImage:
                            "person.crop.circle").foregroundColor(.white)
                    Image("frisbee1")
                    .resizable()
                    .frame(width: 256.0, height: 128.0)
                    
                    Label("John Cena", systemImage: "person.crop.circle")
                        .foregroundColor(.white)
                    Image("frisbee2")
                    .resizable()
                    .frame(width: 256.0, height: 128.0)
                    Spacer()
                    Spacer()
                        .navigationBarTitle("HIGHLIGHTS", displayMode: .inline)
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
}
