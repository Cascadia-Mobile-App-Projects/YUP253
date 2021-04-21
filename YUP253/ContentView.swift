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
            
            Text("Stephen Content View")
                    .tabItem {
                        Label("Home", systemImage: "house.fill").foregroundColor(.orange)
                    }
                .tag(1)
            Text("Adam Content View")
                        .tabItem {
                            Label("Events", systemImage: "calendar")
                        }
                .tag(2)
            Text("Anton Content View")
                        .tabItem {
                            Label("Highlights", systemImage: "star.fill")
                        }
                .tag(3)
            Text("Sean Content View")
                    .tabItem {
                        Label("About", systemImage: "questionmark.circle")
                    }
                .tag(4)
            }
        .accentColor(.orange)
        .font(.largeTitle)
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
