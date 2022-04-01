//
//  ContentView.swift
//  SPCA_Test_3
//
//  Created by Zane Haubach on 3/1/22.
/*

import SwiftUI

struct ContentViewBackup: View {
    @StateObject var viewModel = ViewModel()
    @State var animate: Bool = true
    @State var showFilterMenu = false
    @State var animalList: [Animal] = []
    @State var filterCriteria: criteria
    @State var emptyList = false
    
    let SPCABlue = Color(red: 33/255, green: 88/255, blue: 153/255)
    let SPCABlueUI = UIColor(red: 33/255, green: 88/255, blue: 153/255, alpha: 1)

    var body: some View {
        let drag = DragGesture()
            .onEnded{
                if $0.translation.width < -100{
                    withAnimation{
                        showFilterMenu.toggle()
                    }
                }
            }
        return GeometryReader{ geometry in
            VStack{
                ZStack{
                    
                    //content
                    ZStack(alignment: .leading){
                        NavigationView{
                            ScrollView{
                                LazyVStack{
                                    let filteredList = filterAnimals(animals: viewModel.animals, by: filterCriteria)
                                    if(filteredList.isEmpty){
                                        Text("No results")
                                    }
                                    else{
                                        ForEach(filteredList){ animals in
                                            NavigationLink(destination: DetailView(animal: animals) ){
                                                
                                                VStack{
                                                    URLImage(urlString: animals.primary_photo_cropped?.medium ?? "")
                                                        .frame(width: 410, height: 410)
                                                        .cornerRadius(30.0)
                                                        .overlay(
                                                            RoundedRectangle(cornerRadius: 30)
                                                                .stroke(SPCABlue, lineWidth: 10)
                                                        )
                                                    
                                                    VStack(alignment: .center){
                                                        Text(animals.name)
                                                            .font(.title)
                                                            .foregroundColor(.white)
                                                            .bold()
                                                            .frame(width: 300, alignment: .center)
                                                            Text(animals.age)
                                                            .foregroundColor(.white)
                                                            + Text(" - ")
                                                            .foregroundColor(.white)
                                                            + Text(animals.breeds.primary ?? "")
                                                            .foregroundColor(.white)
                                                    }
                                                    .padding(.bottom)
                                                }
                                                .background(SPCABlue)
                                                .cornerRadius(30.0)
                                                .offset(x: self.showFilterMenu ? geometry.size.width/2 : 0)
                                                .padding(.top)
                                            }
                                        }
                                    }
                                }
                                .onAppear{
                                    viewModel.fetchToken()
                                }
                            }
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                            .toolbar{
                                ToolbarItem(placement: .navigationBarTrailing){
                                    NavigationLink(destination: EventView()) {
                                        Label("Work Folder", systemImage: "list.bullet")
                                    }
                                }
                                ToolbarItem(placement: .navigationBarLeading){
                                    Button("Filter"){
                                        withAnimation{
                                            showFilterMenu.toggle()
                                        }
                                    }
                                }
                                ToolbarItem(placement: .principal){
                                    Image("SPCA_logo_top")
                                        .resizable()
                                        .frame(width: 165.0, height: 65)
                                        .ignoresSafeArea()
                                }
                            }
                        }
                        .accentColor(.white)
                        .disabled(self.showFilterMenu ?true :false)
                        
                        
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
                        

                        
                        
                        if self.showFilterMenu{
                            FilterView(showFilterMenu: $showFilterMenu, filterCriteria: $filterCriteria)
                                .frame(width: geometry.size.width/1.5)
                                .transition(.move(edge: .leading))
                        }
                    }
                }
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now()+2){
                        animate.toggle()
                    }
                }
            }
        }
        .gesture(drag)
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(filterCriteria: .init(type: "", age: "", gender: "", size: ""))
        }
    }
}



}
*/
