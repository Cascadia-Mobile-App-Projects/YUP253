//
//  ContentView.swift
//  YUP253
//
//  Created by Student Account on 4/21/21.
//

import SwiftUI

struct ContentView: View {
    @State var selectedView = 1
    var body: some View {
        
        TabView{
         Text("Adam's Page")
            .padding()
            .tabItem { Text("Adam") }
        }
        TabView{
         Text("Adam's Page")
            .padding()
            .tabItem { Text("Adam") }
        }
        TabView{
         Text("Adam's Page")
            .padding()
            .tabItem { Text("Adam") }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
