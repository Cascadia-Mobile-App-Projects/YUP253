//
//  ClearDB.swift
//  YUP253
//
//  Created by Anton Tran on 5/23/21.
//

import SwiftUI

 
 

struct ClearDB: View {

 
 

    @EnvironmentObject var theDataRepo: DataRepository

     

    // To dismiss the screen:

    // https://stackoverflow.com/a/57279591/250610

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

     

    func clearDB() {

        theDataRepo.deleteAllHighlight()

         

        // return to previous screen:

        self.presentationMode.wrappedValue.dismiss()

    }

 
 

    func cancelDelete() {

        // return to previous screen:

        self.presentationMode.wrappedValue.dismiss()

    }

 
 

     

    var body: some View {

        NavigationView {

        VStack {

            Spacer()

            Spacer()

            Spacer()

            Image("253")

                 

                .aspectRatio(contentMode: .fit)

            (LinearGradient(gradient: Gradient(colors: [Color.black, (Color(red: 0.022, green: 0.24, blue: 0.561))]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)) 

             

             

            Text("delete all highlights?")

                .font(.subheadline)

                    .fontWeight(.bold)

                    .foregroundColor(.white)

                    .multilineTextAlignment(.center)

                    .lineLimit(nil)

                .lineSpacing(5)

                .padding(30)

                 

            VStack {

                 

                 

                Button(action: clearDB)

                {

                     

                    Text("Yes?")

                        .font(.subheadline)

                            .fontWeight(.bold)

                            .foregroundColor(.blue)

                            .multilineTextAlignment(.trailing)

                            .lineLimit(nil)

                         

                        .lineSpacing(20)

                     

                     

                }

                .padding(25)

                Button(action: cancelDelete)

                {

                     

                    Text("No?")

                         

                        .font(.subheadline)

                            .fontWeight(.bold)

                            .foregroundColor(.red)

                            .multilineTextAlignment(.leading)

                            .lineLimit(nil)

                        .lineSpacing(10)

                         

                }

                

                }

            Spacer()

                .padding(20)

                 

            }

        .navigationBarTitle(" ", displayMode: .inline)

        .background(LinearGradient(gradient: Gradient(colors: [Color.black, (Color(red: 0.022, green: 0.24, blue: 0.561))]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)).preferredColorScheme(.dark)

        }

         

    }

 
 

 
 

struct ClearDB_Previews: PreviewProvider {

    static var previews: some View {

         ClearDB()

    }

}

}
