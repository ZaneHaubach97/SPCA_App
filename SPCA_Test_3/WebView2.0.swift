//
//  WebView2.0.swift
//  SPCA_Test_3
//
//  Created by Zane Haubach on 3/30/22.
//

import SwiftUI

struct WebView2_0: View {
    var body: some View {
        Text("Hello World")
    }
}

struct WebView2_0_Previews: PreviewProvider {
    static var previews: some View {
        WebView2_0()
    }
}

/*func getHTML(){
    let url = URL(string:"https://winchesterspca.org/blog-2/events/")!
    var URLContent: NSString = ""
    let task = URLSession.shared.dataTask(with: url){
        (data, response, error) -> Void in
        
        if error == nil{
            URLContent = (NSString(data: data!, encoding: String.Encoding.ascii.rawValue) as NSString?)!
        }
        print(URLContent)
        
    }
    task.resume()
    
    
    
}*/
