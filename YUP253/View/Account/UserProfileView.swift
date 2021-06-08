//  YUP253 Project
//
//  UserProfileView.swift
//
//  Created by Jason Lacy on 6/7/21
//

import SwiftUI
import RealmSwift

struct UserProfileView: View {
    
    private let currentUser:Person
    
    init(userProfile:Person) {
        currentUser = userProfile
    }
    
    @EnvironmentObject var theDataRepo: DataRepository
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {  (LinearGradient(gradient: Gradient(colors: [Color.black, (Color(red: 0.022, green: 0.24, blue: 0.561))]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
            
        VStack {
            HStack {
                padding()
                //imageselector load user's profile picture here
                padding()
            }
            VStack {
                padding()
                Text("Profile Info:").fontWeight(.bold)
                
                ForEach(self.theDataRepo.loadPerson().map(Person.init()), id: \.self) {
                    
                    
                    
                }
                padding()
            }
        }
        
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
