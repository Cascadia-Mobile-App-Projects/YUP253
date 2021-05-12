//
//  ContentView.swift
//  YUP253
//
//  Created by Student Account on 4/21/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = 1
    var body: some View {
        TabView(selection: $selection) {
            

            loginView()
                        .tabItem {
                            Label("Home", systemImage: "house.fill")
                        }
                .tag(0)
            EventView()
                .tabItem {
                    Label("Events", systemImage: "calendar")
                }
                .tag(0)
            highlightPage()
                        .tabItem {
                            Label("Highlights", systemImage: "star.fill")
                        }

                .tag(2)
            
            About()
                    .tabItem {
                        Label("About", systemImage: "questionmark.circle")
                        
                        
                        
                    }
                .tag(3)
            }
        .accentColor(.black)
        
        }
}

extension TabView {

    func myTabViewStyle() -> some View {
        self.background(Color.orange)

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
