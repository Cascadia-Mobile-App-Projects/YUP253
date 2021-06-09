//
//  About.swift
//  YUP253
//
//  Created by Sean Jones on 4/21/21.
//
import SwiftUI


struct About: View {
@State private var selection: String? = nil
    
    var body: some View {
        ZStack{
        NavigationView {
            
            VStack {
                Spacer()
                Image("253")
                 
                    .padding(.bottom, 200.0)
                
                
                NavigationLink(destination:  About_Us(),
                               
                               tag: "Second", selection: $selection)
                    { EmptyView()}
                
                NavigationLink(destination:  Mission_V(),
                               
                               
                               tag: "Third", selection: $selection)
                    { EmptyView()}
                
                NavigationLink(destination:  Core_Val(),
                               
                               
                               tag: "Fourth", selection: $selection)
                    { EmptyView()}
                
                Button("About Us") {
                    
                    self.selection = "Second"
                    
                    
                }
                .padding(15.0)
                Button("Mission/Vision") {
                    self.selection = "Third"
                        
                }
                .padding(15.0)
                Button("Core Values") {
                    self.selection = "Fourth"
                        
                }
                .padding(15.0)
                
            }
            .padding(110.0)
            
            .background(LinearGradient(gradient: Gradient(colors: [Color.black, (Color(red: 0.022, green: 0.24, blue: 0.561))]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
            //.background(Color(red: 0.022, green: 0.24, blue: 0.561))
            
            .navigationBarTitle("ABOUT", displayMode: .inline).padding(-23)
            }
           
               }
        }


struct About_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            About()
                .previewDevice("iPhone 12")
                .previewLayout(.device)
            About()
        }
    }
}
}
