//
//  UpdateHighlight.swift
//  YUP253
//
//  Created by Anton Tran on 5/23/21.
//


import SwiftUI

struct UpdateHighlight: View {
        
    
    @State var user: String = ""
    @State var text: String = ""
    
    
    private var original: Highlight = Highlight()
    
    init() { }
    
    init(originalHighlight OD: Highlight) {
        self.init()
        original = OD
        text = OD.text
        user = OD.user
    }

    @EnvironmentObject var theDataRepo: DataRepository
    
    func showForm() {
        print("showForm")
        print("user: \(user)")
        print("text: \(text)")
        
    }
    
    // To dismiss the screen:
    // https://stackoverflow.com/a/57279591/250610
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    func updateHighlightInDB() {
        
        
        showForm()
        
        theDataRepo.updateHighlight(id: self.original.id, newUser: self.user, newText: self.text)
        
        // return to previous screen:
        self.presentationMode.wrappedValue.dismiss()
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Edit Text:")) {
                    TextField("\(self.original.user)", text: self.$user)
                    TextField("\(self.original.text)", text: self.$text)
                    
                }
                Button(action: updateHighlightInDB)
                {
                    Text("Update")
                }
            }
            .navigationBarTitle("Update Post")
            
        }
        
        
    }
}

struct UpdateHighlight_Previews: PreviewProvider {
    static var previews: some View {
        Text("HELLO")
        
    }
}
