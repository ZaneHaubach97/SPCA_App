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
    let SPCABlue = Color(red: 33/255, green: 88/255, blue: 153/255)
    
    @StateObject var eventViewer = EventViewer()
    var body: some View {
        return GeometryReader{ geometry in
            NavigationView{
                ScrollView{
                    LazyVStack{
                        ForEach(eventViewer.events, id: \.self){ event in
                            VStack{

                                URLImage(urlString: event.image)
                                    .frame(width: ((geometry.size.width)-20))
                                    .cornerRadius(30.0)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 30)
                                            .stroke(SPCABlue, lineWidth: 10)
                                    )
                                Text(event.eventName)
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .fontWeight(.black)
                                    .multilineTextAlignment(.center)
                                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                                    .accessibility(identifier: "eventNameText")
                                    
                                VStack{
                                    ForEach(event.details, id: \.self){ detail in
                                        Text(detail)
                                            .foregroundColor(.white)
                                            .padding()
                                            
                                    }
                                }
                                Link(destination: URL(string: "https://winchesterspca.org/blog-2/events/")!, label: {Text("View Event Online")
                                        .underline()
                                        .font(.headline)
                                        .foregroundColor(Color.white)
                                        .padding()
                                })
                            }
                            .frame(width: ((geometry.size.width)-20))
                            .background(SPCABlue)
                            .cornerRadius(30.0)
                            .padding(.top)
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
                    ToolbarItem(placement: .navigationBarTrailing){
                        Link("Donate", destination: URL(string: "https://winchesterspca.org/donate/")!)
                    }
                }
            }
            .accessibility(identifier: "eventViewNav")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
    }
}


