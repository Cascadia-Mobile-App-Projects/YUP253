//
//  AddHighlight.swift
//  YUP253
//
//  Created by Anton Tran on 5/23/21.
//


import SwiftUI

struct AddHighlight: View {
    
    @State var text: String = ""
    
    

    @EnvironmentObject var theDataRepo: DataRepository
    
    func showForm() {
        print("showForm")
        print("\(text)")
        
    }
    
    // To dismiss the screen:
    // https://stackoverflow.com/a/57279591/250610
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    func saveHighlightToDB() {
        
        
        showForm()
        
        theDataRepo.saveHighlight(newText: self.text)
        
        // return to previous screen:
        self.presentationMode.wrappedValue.dismiss()
    }
    
    var body: some View {
        VStack {
        NavigationView {
            
            Form {
                
                Section(header: Text("New Highlight Info:")) {
                    TextField("Enter Text", text: $text)
                    
                }
                Button(action: saveHighlightToDB)
                {
                    Text("Post")
                }
                
            }
            
            
            .navigationBarTitle("Add New Highlight")
            
            
        }
        //(LinearGradient(gradient: Gradient(colors: [Color.black, (Color(red: 0.022, green: 0.24, blue: 0.561))]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
        
        }
        
    }
    
}

struct AddHighlight_Previews: PreviewProvider {
    
    static var previews: some View {
        AddHighlight()
    }
}
