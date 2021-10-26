//
//  highlightPage.swift
//  YUP253
//
//  
//



import SwiftUI
import RealmSwift

struct HighlightPage: View {
    
  @ViewBuilder var body: some View {
      SafariView(url: URL(string: "https://www.instagram.com/253youthultimate/?hl=en")!)
            }
        
    }


struct HighlightPage_Previews: PreviewProvider {
    static var previews: some View {
        HighlightPage()
    }
}
