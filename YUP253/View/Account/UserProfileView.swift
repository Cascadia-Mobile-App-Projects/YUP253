//
//  UserProfileView.swift
//  YUP253
//
//  Created by Student Account on 11/1/21.
//

import SwiftUI
import RealmSwift

struct UserProfileView: View {
    @EnvironmentObject var theDataRepo: DataRepository
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var body: some View {
        VStack {
            HStack {
                Image{profilePic)
                    
            }
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
