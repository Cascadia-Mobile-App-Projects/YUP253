//  YUP253 Project
//
//  UserProfileView.swift
//
//  Created by Jason Lacy on 6/7/21
//

import SwiftUI
import RealmSwift

struct UserProfileView: View {
    
    @State private var selection: String? = nil
    
    @EnvironmentObject var theDataRepo: DataRepository
    
    var body: some View {
        NavigationView{
            VStack {
                Image("253")
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom)
                    .navigationBarTitle("User Profile", displayMode: .inline)
                Text("user information goes here :)")
        }
        .padding(.top, 40)
        .background(LinearGradient(gradient: Gradient(colors: [Color.black, (Color(red: 0.022, green: 0.24, blue: 0.561))]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
            .environmentObject(DataRepository(realm: try! Realm()))
    }
}
