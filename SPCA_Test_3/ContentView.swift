//
//  ContentView.swift
//  SPCA_Test_3
//
//  Created by Zane Haubach on 3/1/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @State var animate: Bool = true
    @State var animalList: [Animal] = []
    @State var filterCriteria: criteria
    @State var emptyList = false
    
    let SPCABlue = Color(red: 33/255, green: 88/255, blue: 153/255)
    let SPCABlueUI = UIColor(red: 33/255, green: 88/255, blue: 153/255, alpha: 1)

    var body: some View {
        return GeometryReader{ geometry in
            VStack{
                ZStack{
                    
                    //content
                    ZStack(alignment: .leading){
                        BottomBarView()
                        
                        
                        //Splash Screen
                        ZStack{
                            Color(SPCABlueUI)
                            VStack {
                                Image("SPCA_logo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                .frame(width: 189, height: 197)
                                
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint:.white))
                                    .scaleEffect(2)
                                    .padding(.top, 40.0)
                            }
                        }
                        .edgesIgnoringSafeArea(.all)
                        .opacity(animate ? 1 : 0)
                    }
                }
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now()+2){animate.toggle()}
                }
            }
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                ContentView(filterCriteria: .init(type: "", age: "", gender: "", size: ""))
            }
        }
    }
}
