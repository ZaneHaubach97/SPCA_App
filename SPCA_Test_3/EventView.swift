//
//  ContentView.swift
//  WebTest
//
//  Created by Zane Haubach on 3/30/22.
//

import SwiftUI
import SwiftSoup

struct EventView: View {
    var URLString = "https://winchesterspca.org/blog-2/events/"
    
    @StateObject var eventViewer = EventViewer()
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVStack{
                    ForEach(eventViewer.events, id: \.self){ event in
                        VStack{

                            URLImage(urlString: event.image)
                                .frame(width: 440)
                                .padding(.vertical)
                            Text(event.eventName)
                                .font(.title)
                                .fontWeight(.black)
                                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                                
                            VStack{
                                ForEach(event.details, id: \.self){ detail in
                                    Text(detail)
                                        .padding()
                                        
                                }
                            }
                        }
                    }
                }
                .onAppear{
                    DispatchQueue.main.async{eventViewer.coordinateHTML(urlString: URLString)}
                }
            }
            .toolbar{
                ToolbarItem(placement: .principal){
                    Image("SPCA_logo_top")
                        .resizable()
                        .frame(width: 165.0, height: 65)
                        .ignoresSafeArea()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
    }
}


