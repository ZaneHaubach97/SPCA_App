//
//  WebViewTest.swift
//  SPCA_Test_3
//
//  Created by Zane Haubach on 3/30/22.
//

import SwiftUI



func getHTML(){
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
}
