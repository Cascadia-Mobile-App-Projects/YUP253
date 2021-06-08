//
//  CreateAccountLoginView.swift
//  YUP253
//
//  Created by Anton Tran on 5/19/21.
//

import SwiftUI
import RealmSwift


struct CreateAccountLoginView: View {
    
    @EnvironmentObject var theDataRepo: DataRepository
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var selection: String? = nil
    
    @State var username: String = ""
    @State var password: String = ""
    @State var email: String = ""
    @State var fName: String = ""
    @State var lName: String = ""
    @State var age: String = ""
    @State var phNum: String = ""
    @State var showAlert = false

    
    func saveProfile() {
                theDataRepo.savePerson(
                    pUserName: self.username, pFName: self.fName, pPassword: self.password, pLName: self.lName, pAge: self.age, pNum: self.phNum, pEmail: self.email)
        self.presentationMode.wrappedValue.dismiss()
        }
    
    var body: some View {
        
        NavigationView {
            
            Form {
                Section(header: Text("Create A New Profile").font(.title3))
                     {
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
                NavigationLink(
                    destination: loginView(),
                    tag: ("goBack"),
                    selection: $selection) {
                    Button(action: {
                                saveProfile();
                                showAlert = true;
                                self.selection = "goBack"
                    })
                    {
                        HStack {
                            Spacer()
                            Text("SAVE PROFILE").foregroundColor(Color.blue).bold()
                            Spacer()
                        }
                    }
                    .accentColor(Color.black)
                    .padding()
                    .background(Color(UIColor.darkGray))
                    .cornerRadius(4.0)
                    .padding(Edge.Set.vertical, 20)
                }
                }
            .navigationBarTitle("PROFILE CREATION")
            .edgesIgnoringSafeArea(.all)            }
        }
}
struct CreateAccountLoginView_Previews: PreviewProvider {
    static var previews: some View {
            CreateAccountLoginView()
    }
}

