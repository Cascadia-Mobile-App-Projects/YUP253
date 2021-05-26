//
//  HomeView.swift
//  YUP253
//
//  Created by Anton Tran on 5/19/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        ZStack{
            Color(red: 0.022, green: 0.24, blue: 0.561)
                .ignoresSafeArea()
            VStack{
                Text("HOME PAGE")
            }
            
        }
        
            
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
