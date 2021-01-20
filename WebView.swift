//
//  WebView.swift
//  final
//
//  Created by User11 on 2021/1/6.
//

import Foundation
import SwiftUI
import WebKit
struct WebView: UIViewRepresentable {
    let urlString: String
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        if let url = URL(string: urlString){
            let request = URLRequest(url:url)
            webView.load(request)
        }
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
    
    
    typealias UIViewType = WKWebView
    
    
}


struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(urlString: "https://drive.google.com/file/d/1AAei4XiGhdK4C-GzDq8Ozpx94RKBcPlz/view")
    }
}
