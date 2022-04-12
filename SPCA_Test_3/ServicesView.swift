//
//  ServicesView.swift
//  SPCA_Test_3
//
//  Created by Zane Haubach on 4/7/22.
//

import SwiftUI

struct ServicesView: View {
    
    var URLString = "https://winchesterspca.org"
    let SPCABlue = Color(red: 33/255, green: 88/255, blue: 153/255)
    @StateObject var serviceViewer = ServiceViewer()
    
    var body: some View {
        return GeometryReader{ geometry in
            NavigationView{
                ScrollView{
                    LazyVStack{
                        ForEach(serviceViewer.services, id: \.self){ service in
                            VStack {
                                Text(service.serviceName)
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .fontWeight(.black)
                                    .multilineTextAlignment(.center)
                                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                                
                                Link(destination: URL(string: service.serviceLink)!, label: {Text("View More Information Online")
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
                }
                .onAppear{
                    DispatchQueue.main.async{serviceViewer.coordinateHTML(urlString: URLString)}
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
        }
    }
}

struct ServicesView_Previews: PreviewProvider {
    static var previews: some View {
        ServicesView()
    }
}
