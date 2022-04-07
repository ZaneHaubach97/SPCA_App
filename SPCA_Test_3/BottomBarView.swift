//
//  BottomBarView.swift
//  SPCA_Test_3
//
//  Created by Zane Haubach on 3/29/22.
//

import SwiftUI

struct BottomBarView: View{
    
    @State var animate: Bool = true
    @State var didLoad: Bool = false
    let SPCABlue = Color(red: 33/255, green: 88/255, blue: 153/255)
    init(){
        let navbarAppearance = UINavigationBarAppearance()
        navbarAppearance.backgroundColor = UIColor(SPCABlue)
        navbarAppearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = navbarAppearance
        UINavigationBar.appearance().compactAppearance = navbarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navbarAppearance
        UINavigationBar.appearance().tintColor = UIColor.white
    }
    var body: some View {
        TabView {
            PetView(filterCriteria: .init(type: "", age: "", gender: "", size: ""))
                .tabItem {
                    Image(systemName: "pawprint")
                    Text("Pets")
            }
            EventView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Events")
            }
            /*ServicesView()
                .tabItem {
                    Image(systemName: "list.bullet.rectangle.portrait")
                    Text("Services")
            }*/
        }
    }
}
