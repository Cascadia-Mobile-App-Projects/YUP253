//
//  UpdateHighlight.swift
//  YUP253
//
//  Created by Anton Tran on 5/23/21.
//


import SwiftUI

struct UpdateHighlight: View {
        
    
    @State var text: String = ""
    @State var showingImagePicker = false
    @State var inputImage: UIImage?
    @State var image: Image?
    private var original: Highlight = Highlight()
    
    init() { }
    
    init(originalHighlight OD: Highlight) {
        self.init()
        original = OD
        text = OD.text
        inputImage = OD.image
    }

    @EnvironmentObject var theDataRepo: DataRepository
    
    func showForm() {
        print("showForm")
        print("text: \(text)")
        
        
    }
    
    // To dismiss the screen:
    // https://stackoverflow.com/a/57279591/250610
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    func updateHighlightInDB() {
        
        
        showForm()
        
        theDataRepo.updateHighlight(id: self.original.id, newText: self.text, newImg: self.inputImage)
        
        // return to previous screen:
        self.presentationMode.wrappedValue.dismiss()
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Edit Text:")) {
                    TextField("\(self.original.text)", text: self.$text)
                    ZStack{
                        
                        
                        if image != nil {
                            image?
                                .resizable()
                                .scaledToFit()
                        } else {
                            Text("Tap to select a picture").padding(.leading, 40)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                .font(.headline)
                        }
                    }
                    .onTapGesture {
                        self.showingImagePicker = true
                    }
                    
                }
                Button(action: updateHighlightInDB)
                {
                    Text("Update")
                }
            }
            .navigationBarTitle("Edit Post")
            
        }
        .padding([.horizontal, .bottom])
        .navigationBarTitle("Select Image")
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage)
        }
        
        
    }
    func loadImage() {
        guard let inputImage = inputImage else {
            return }
        image = Image(uiImage: inputImage)
        
        
        
    }

}


struct UpdateHighlight_Previews: PreviewProvider {
    static var previews: some View {
        UpdateHighlight()
        
    }
}
