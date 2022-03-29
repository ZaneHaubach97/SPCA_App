//
//  PetView.swift
//  SPCA_Test_3
//
//  Created by Zane Haubach on 3/29/22.
//

import SwiftUI

struct PetView: View {

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
                                                .foregroundColor(Color.gray)
                                                .padding(.top, 300)
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
                            
                            if self.showFilterMenu{
                                FilterView(showFilterMenu: $showFilterMenu, filterCriteria: $filterCriteria)
                                    .frame(width: geometry.size.width/1.5)
                                    .transition(.move(edge: .leading))
                            }
                        }
                    }
                }
            }
            .gesture(drag)
        }
    }


struct PetView_Previews: PreviewProvider {
    static var previews: some View {
        PetView(filterCriteria: .init(type: "", age: "", gender: "", size: ""))
    }
}
