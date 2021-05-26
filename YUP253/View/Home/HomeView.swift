//
//  HomeView.swift
//  YUP253
//
//  Created by Anton Tran on 5/19/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
        ZStack{
            
            

           
           (LinearGradient(gradient: Gradient(colors: [Color.black, (Color(red: 0.022, green: 0.24, blue: 0.561))]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
            //.background(Color(red: 0.022, green: 0.24, blue: 0.561))
            .edgesIgnoringSafeArea(.all)
            VStack{
                Text("HOME PAGE")
                    .foregroundColor(.white)
            }
            Image("253")
                
                .aspectRatio(contentMode: .fit)
                .padding(.bottom, 200.0)
                Spacer()
            .navigationBarTitle("Home", displayMode: .inline)
        
        
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
}
