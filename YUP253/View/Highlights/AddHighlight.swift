//
//  AddHighlight.swift
//  YUP253
//
//  Created by Anton Tran on 5/23/21.
//


import SwiftUI
import RealmSwift

struct AddHighlight: View {
    
    @State var text: String = ""
    @State var showingImagePicker = false
    @State var inputImage: UIImage?
    @State var image: Image?
    
    
    
    
    

    @EnvironmentObject var theDataRepo: DataRepository
    
    func showForm() {
        print("showForm")
        print("\(text)")
        print("\(String(describing: inputImage))")
        
        
    }
    
    
    // To dismiss the screen:
    // https://stackoverflow.com/a/57279591/250610
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    func saveHighlightToDB() {
        
        
        showForm()
        
        theDataRepo.saveHighlight(newText: self.text, newImg: self.inputImage)
        
        // return to previous screen:
        self.presentationMode.wrappedValue.dismiss()
    }
    
    var body: some View {
        
        NavigationView{
            VStack{
                
                Form {
                    
                    Section(header: Text("New Highlight Info:")) {
                        TextField("Enter Text", text: $text)
                        
                        ZStack{
                            Rectangle()
                                .fill(Color.white)
                            
                            if image != nil {
                                
                                image?
                                    .resizable()
                                    .scaledToFit()
                            } else {
                                Text("Tap to select a picture")
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                    .font(.headline)
                            }
                        }
                        .onTapGesture {
                            self.showingImagePicker = true
                        }
                        
                        
                        
                        
                        
                    }
                    
                    
                    
                    Button(action: saveHighlightToDB)
                    {
                        Text("Post")
                    }
                    
                }
                
                
                
            }
            
            .padding([.horizontal, .bottom])
            .navigationBarTitle("Select Image")
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                 ImagePicker(image: self.$inputImage)
            }
        }
        
        
        
    }
    func loadImage() {
        guard let inputImage = inputImage else {
            return }
        image = Image(uiImage: inputImage)
        
        
        
    }
    
    

}




struct AddHighlight_Previews: PreviewProvider {
    
    static var previews: some View {
        AddHighlight()
    }
}
