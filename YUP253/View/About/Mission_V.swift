//
//  Mission_V.swift
//  YUP253
//
//  Created by Sean Jones on 5/10/21.
//

import SwiftUI

struct Mission_V: View {
    var body: some View {
        ZStack{
            Color(red: 0.022, green: 0.24, blue: 0.561).ignoresSafeArea()

        
        
        VStack {
            
           
            
                Image("253")
            
            Text("MISSION\n\n PROVIDE, EMPOWER, PLAY\n     Provide a safe place for ALL people to participate, centering equity and health relationships\n     Incorporate diversity, equity and inclusion training, conversations, and practices into all efforts and activities.\n     Intentionally create policies that address barriers and equity to create space for marginalized players.\n     Empower youth through ultimate and our program.\n     Educate and empower youth sport leaders/volunteers/parents.\n     Building confidence, developing character in being future community-minded individuals.\n     Play with joy.\n     Integrate and celebrate the community of our youth in our programming.\n     Promote and develop fair and spirited play.\n     Foster and participate in continuous learning (growth mindset).\n     Help spread a love for ultimate").font(.subheadline)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .lineLimit(nil)
        .lineSpacing(10)
            .padding(.bottom, 35.0)
            
        }
    }
    }
}

struct Mission_V_Previews: PreviewProvider {
    static var previews: some View {
        Mission_V()
    }
}
