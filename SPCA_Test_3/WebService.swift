//
//  WebService.swift
//  
//
//  Created by Zane Haubach on 3/22/22.
//

import SwiftUI
import WebKit

let contentRules = """
[
  {
    "trigger": {
      "url-filter": "https://winchesterspca.org"
    },
    "action": {
      "type": "css-display-none",
      "selector": "header"
    }
  },
  {
    "trigger": {
      "url-filter": "https://winchesterspca.org"
    },
    "action": {
      "type": "css-display-none",
      "selector": "footer"
    }
  },
  {
    "trigger": {
      "url-filter": "https://winchesterspca.org"
    },
    "action": {
      "type": "css-display-none",
      "selector": ".topOfPage"
    }
  }
]
"""

struct WebService: UIViewRepresentable{
    let url: URL?
    
    func makeUIView (context: Context) -> WKWebView{
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        return WKWebView(
            frame: .zero,
            configuration: config
        )
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context){
        guard let myURL = url else{return}
        let request = URLRequest(url: myURL)
        WKContentRuleListStore.default().compileContentRuleList(forIdentifier: "ContentBlockingRules", encodedContentRuleList: contentRules) { rulesList, error in
          if let error = error {
            print(error)
            return
          }
          guard let rulesList = rulesList else { return }
          let config = uiView.configuration
          config.userContentController.add(rulesList)
          uiView.load(request)
        }
    }
}


    /*guard let myURL = url else{return}
    
    let request = URLRequest(url: myURL)
    uiView.load(request)*/
