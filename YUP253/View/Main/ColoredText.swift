//
//  ColoredText.swift
//  YUP253
//
//  Created by Sean Jones on 10/25/21.
//

import SwiftUI

 
 

struct ColoredText: View {

    @State static var color: Color = .white

       @State var text: String

 
 

       var body: some View {

           Text(text)

               .foregroundColor(ColoredText.color)

       }

   } 
