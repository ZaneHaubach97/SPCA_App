//
//  EventViewer.swift
//
//  "https://winchesterspca.org/blog-2/events/"
//  Created by Zane Haubach on 3/30/22.
//
import Foundation
import SwiftUI
import SwiftSoup

class ServiceViewer: ObservableObject{
    
    @Published var services: [Service] = []
    
    //Function used to coordinate the actions of all functions below it in this file.
    func coordinateHTML(urlString: String){
        getHTML(URLString: urlString) { HTMLString in
            let servicesList: [Service] = self.parseServiceHTML(html: HTMLString)
            DispatchQueue.main.async{
                self.services = servicesList
            }
        }
    }
    
    //Function used to reach out to the SPCA website events page and gather the HTML for the entire page and return it for parsing.
    func getHTML(URLString: String, completion: @escaping ((String) -> Void)){
        let url = URL(string:URLString)!
        var URLContent: NSString = ""
        let task = URLSession.shared.dataTask(with: url){
            (data, response, error) -> Void in
            
            if error == nil{
                URLContent = (NSString(data: data!, encoding: String.Encoding.utf8.rawValue) as NSString?)!
            }
            completion(URLContent as String)
        }
        task.resume()
    }
    
    func parseServiceHTML(html: String) -> [Service]{
        var serviceList: [Service] = []
        do {
            let doc: Document = try SwiftSoup.parse(html)
            let htmlBlock = try doc.getElementsByClass("menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-3497").first()
            
            let services: Elements = try htmlBlock!.select("a")
            for i in 1..<services.count {
                var tempService: Service = .init(serviceName: "", serviceLink: "")
                tempService.serviceName = try services[i].text()
                tempService.serviceLink = try services[i].attr("href")
                serviceList.append(tempService)
            }
        } catch Exception.Error(_, _) {
            print("")
        } catch {
            print("")
        }
        return serviceList
    }
}
