//
//  About_Us.swift
//  YUP253
//
//  Created by Sean Jones on 5/10/21.
//

import SwiftUI

struct About_Us: View {
    var body: some View {
        
        ZStack{
            Color(red: 0.022, green: 0.24, blue: 0.561).ignoresSafeArea()

        
        VStack {
            
           
            
                Image("253")
            
        Text("ABOUT US \n\nThe 253 Youth Ultimate Program\n has a mission to create a youth ultimate program in the Greater Tacoma Area that provides a radically inclusive, empowered, and joyful community. The program is committed to providing a safe place for all youth to participate, empower youth through ultimate, and play ultimate with joy. We plan to host clinics, tournaments, leagues, and more to help bring ultimate to all!")
            .font(.subheadline)
                             .fontWeight(.bold)
                             .multilineTextAlignment(.center)
                             .lineLimit(nil)
                         .lineSpacing(10)
                             .padding(.bottom, 35.0)
            
            
        }
    }
}

struct About_Us_Previews: PreviewProvider {
    static var previews: some View {
        About_Us()
    }
}
}
