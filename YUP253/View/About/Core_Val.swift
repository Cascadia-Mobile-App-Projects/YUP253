//
//  Core_Val.swift
//  YUP253
//
//  Created by Sean Jones on 5/10/21.
//

import SwiftUI

struct Core_Val: View {
    var body: some View {
        
        ZStack{
            
            Color(red: 0.022, green: 0.24, blue: 0.561).ignoresSafeArea()
        
        VStack {
            
                Image("253")
            
        Text("VISION\n\nTo embed equity,\n radically diversify, improve, promote, and empower youth ultimate in the Greater Tacoma Area.\n To create a youth ultimate program in the Greater Tacoma Area that provides a radically inclusive, empowered, and joyful community.").font(.subheadline)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .lineLimit(nil)
        .lineSpacing(10)
            .padding(.bottom, 35.0)
            
        }
    }
        
}
}
struct Core_Val_Previews: PreviewProvider {
    static var previews: some View {
        Core_Val()
    }
}
