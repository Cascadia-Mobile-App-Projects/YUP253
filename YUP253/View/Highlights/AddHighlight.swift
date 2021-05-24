//
//  AddHighlight.swift
//  YUP253
//
//  Created by Anton Tran on 5/23/21.
//


import SwiftUI

struct AddHighlight: View {
    @State var user: String = ""
    @State var text: String = ""
    
    

    @EnvironmentObject var theDataRepo: DataRepository
    
    func showForm() {
        print("showForm")
        print("\(user)")
        print("\(text)")
        
    }
    
    // To dismiss the screen:
    // https://stackoverflow.com/a/57279591/250610
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    func saveHighlightToDB() {
        
        
        showForm()
        
        theDataRepo.saveHighlight(newUser: self.user, newText: self.text)
        
        // return to previous screen:
        self.presentationMode.wrappedValue.dismiss()
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("New Highlight Info:")) {
                    TextField("Enter Username", text: $user)
                    TextField("Enter Text", text: $text)
                    
                }
                Button(action: saveHighlightToDB)
                {
                    Text("Post")
                }
            }
            .navigationBarTitle("Add New Highlight")
            
        }
    }
}

struct AddHighlight_Previews: PreviewProvider {
    static var previews: some View {
        AddHighlight()
    }
}
