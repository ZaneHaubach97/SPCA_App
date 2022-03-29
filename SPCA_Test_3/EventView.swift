//
//  EventView.swift
//  SPCA_Test_3
//
//  Created by Zane Haubach on 3/22/22.
//

import SwiftUI
import HTMLKit
import WebKit

struct EventView: View {
    @State var animate: Bool = true
    @State var didLoad: Bool = false
    init(){
        let navbarAppearance = UINavigationBarAppearance()
        navbarAppearance.backgroundColor = SPCABlueUI
        navbarAppearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = navbarAppearance
        UINavigationBar.appearance().compactAppearance = navbarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navbarAppearance
        UINavigationBar.appearance().tintColor = UIColor.white
    }
    
    let SPCABlue = Color(red: 33/255, green: 88/255, blue: 153/255)
    let SPCABlueUI = UIColor(red: 33/255, green: 88/255, blue: 153/255, alpha: 1)
    
    var body: some View {
        let url = "https://winchesterspca.org/blog-2/events/"
        ZStack {
            WebService(url: URL(string: url))
            
            //Splash Screen
            
            if(!didLoad){
                ZStack{
                    Color(UIColor.white)
                    VStack {
                        Text("Loading Events")
                            .font(.headline)
                            .foregroundColor(SPCABlue)
                        
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint:SPCABlue))
                            .scaleEffect(2)
                            .padding(.top, 40.0)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .opacity(animate ? 1 : 0)
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now()+2){
                animate.toggle()
                didLoad = true
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

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
    }
}
