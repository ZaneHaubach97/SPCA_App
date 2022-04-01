//
//  EventViewer.swift
//  
//
//  Created by Zane Haubach on 3/30/22.
//

import Foundation
import SwiftUI
import SwiftSoup

class EventViewer: ObservableObject{
    
    @Published var events: [Event] = []
    
    func getHTML(){
        let url = URL(string:"https://winchesterspca.org/blog-2/events/")!
        var URLContent: NSString = ""
        let task = URLSession.shared.dataTask(with: url){
            (data, response, error) -> Void in
            
            if error == nil{
                URLContent = (NSString(data: data!, encoding: String.Encoding.utf8.rawValue) as NSString?)!
            }
            self.parseImages(html: URLContent as String)
            
        }
        task.resume()
    }

    func parseImages(html: String){
        var tempEventList: [Event] = []
        do {
            let doc: Document = try SwiftSoup.parse(html)
            //Setting up the HTML to break out all event image tags
            let htmlBlock = try doc.getElementsByClass("post_text_area").first()
            let imgsrcs: Elements = try htmlBlock!.select("img[src]")
            let srcsStringArray: [String] = imgsrcs.array().map { try! $0.attr("src").description }
            
            //Setting up the HTML to retrieve all event names
            let eventNames: Elements = try htmlBlock!.select("b")
            let eventNamesArray: [String] = eventNames.array().map { try! $0.text() }

            //setting up the HTML to retrieve all event info from P tags
            var eventDetailsArray: [[String]] = []
            let eventDetails = try htmlBlock!.getElementsByClass("wpb_column vc_column_container vc_col-sm-6")
            var x = 0
            for element in eventDetails{
                var tempEvent: [String] = []
                var y = 0
                for node in try element.getElementsByTag("p") {
                    try tempEvent.append(node.text())
                    y+=1
                }
                if(!tempEvent.isEmpty){
                    eventDetailsArray.append(tempEvent)
                    x+=1
                }
            }

            //Assigning all variables to Published variable 'events'
            var tempEvent = Event(eventName: "", image: "", details: [""], link: "")
            for i in 0..<srcsStringArray.count {
                tempEvent.image = srcsStringArray[i]
                tempEvent.eventName = eventNamesArray[i]
                tempEvent.details = eventDetailsArray[i]
                tempEventList.append(tempEvent)
            }
            
        } catch Exception.Error(_, _) {
            print("")
        } catch {
            print("")
        }
        
        DispatchQueue.main.async{
            self.events = tempEventList
        }
    }

    
    
    
    
    
    
    
    
    
    
}
