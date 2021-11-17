//
//  SafariView.swift
//  YUP253
//
//  Created by Student Account on 10/11/21.
//

import SwiftUI
import SafariServices


struct SafariView: UIViewControllerRepresentable {
    var url: URL
     
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        let safariView = SFSafariViewController(url: url)
        return safariView
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>){
        
    }
}
