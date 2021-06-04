//
//  createAccountLoginView.swift
//  YUP253
//
//  Created by Anton Tran on 5/19/21.
//

import SwiftUI
import RealmSwift


struct createAccountLoginView: View {
    
    @EnvironmentObject var theDataRepo: DataRepository
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var username: String = ""
    @State var password: String = ""
    @State var email: String = ""
    @State var fName: String = ""
    @State var lName: String = ""
    @State var age: String = ""
    @State var phNum: String = ""
     
    
    var body: some View {
        
        NavigationView{
            VStack{
                Form {
                    Section(header: Text("Create A New Profile")){
                    TextField("Username", text: $username)
                        .padding()
                    SecureField("Password", text: $password)
                        .padding()
                    TextField("First Name", text: $fName)
                        .padding()
                    TextField("Last Name", text: $lName)
                        .padding()
                    TextField("Age", text: $age)
                        .keyboardType(.decimalPad)
                        .padding()
                    TextField("Phone Number", text: $phNum)
                        .keyboardType(.decimalPad)
                        .padding()
                    TextField("Email", text: $email)
                        .padding()
                    }
                }
                    Button(
                            action: {
                            theDataRepo.savePerson(pUserName: username, pFName: fName, pPassword: password, pLName: lName, pAge: age, pNum: phNum, pEmail: email)
                        }, label: {
                            Text("SAVE PROFILE")
                        })
                
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color.black, (Color(red: 0.022, green: 0.24, blue: 0.561))]), startPoint: .leading, endPoint: .trailing))
                    .edgesIgnoringSafeArea(.all)
                    .navigationTitle("PROFILE CREATION")
        }
        
    }
}

struct createAccountLoginView_Previews: PreviewProvider {
    static var previews: some View {
            createAccountLoginView()
    }
}
