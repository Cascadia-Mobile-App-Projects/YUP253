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
        
       
        NavigationView {
            
            

            VStack {
                

                (Color(red: 0.0, green: 0.8, blue: 1.5, opacity: 0.1))
                
                    Image("253")
                        
                        .aspectRatio(contentMode: .fit)
                        .padding(.bottom, 200.0)
                    
                   
                NavigationLink(destination:  Text("The 253 Youth Ultimate Program\n\n has a mission to create a youth ultimate program in the Greater Tacoma Area that provides a radically inclusive, empowered, and joyful community. The program is committed to providing a safe place for all youth to participate, empower youth through ultimate, and play ultimate with joy. We plan to host clinics, tournaments, leagues, and more to help bring ultimate to all!")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(nil)
                                .lineSpacing(10)
                                .padding(.bottom, 40.0),
                                    
                                   tag: "Second", selection: $selection)
                        { EmptyView()}
                       NavigationLink(destination: Text("VISION\nTo embed equity,\n radically diversify, improve, promote, and empower youth ultimate in the Greater Tacoma Area.\n\n MISSION\n To create a youth ultimate program in the Greater Tacoma Area that provides a radically inclusive, empowered, and joyful community.").font(.subheadline)
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.center)
                                        .lineLimit(nil)
                                    .lineSpacing(10)
                                        .padding(.bottom, 35.0), tag: "Third", selection: $selection) { EmptyView() }
                NavigationLink(destination: Text("CORE VALUES\n\n PROVIDE, EMPOWER, PLAY\n     Provide a safe place for ALL people to participate, centering equity and health relationships\n     Incorporate diversity, equity and inclusion training, conversations, and practices into all efforts and activities.\n     Intentionally create policies that address barriers and equity to create space for marginalized players.\n     Empower youth through ultimate and our program.\n     Educate and empower youth sport leaders/volunteers/parents.\n     Building confidence, developing character in being future community-minded individuals.\n     Play with joy.\n     Integrate and celebrate the community of our youth in our programming.\n     Promote and develop fair and spirited play.\n     Foster and participate in continuous learning (growth mindset).\n     Help spread a love for ultimate")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(nil)
                                .lineSpacing(5)
                                    .padding(.bottom, 35.0),
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
            .padding(35.0)
            .background(Color(red: 0.0, green: 0.8, blue: 1.5, opacity: 0.7))
                   .navigationBarTitle("ABOUT", displayMode: .inline)
            
            
               }
        .padding(5.0)
           }
    
       }

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}

