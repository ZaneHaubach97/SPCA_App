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
    
    let backgroundColor = Color(red: 33/255, green: 88/255, blue: 153/255)
    let backgroundColorUI = UIColor(red: 33/255, green: 88/255, blue: 153/255, alpha: 1)
    
    var body: some View {
        VStack{
            ZStack{
                
                //content
                ZStack{
                    NavigationView{
                        ScrollView{
                            LazyVStack{
                                ForEach(viewModel.animals){ animals in
                                    NavigationLink(destination: DetailView(animal: animals) ){
                                        
                                        VStack{
                                            URLImage(urlString: animals.primary_photo_cropped?.medium ?? "")
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 30)
                                                        .stroke(Color.white, lineWidth: 10)
                                                )
                                            
                                            VStack(alignment: .center){
                                                Text(animals.name)
                                                    .font(.title)
                                                    .foregroundColor(backgroundColor)
                                                    .bold()
                                                    .frame(width: 300, alignment: .center)
                                                    Text(animals.age)
                                                    .foregroundColor(.gray)
                                                    + Text(" - ")
                                                    .foregroundColor(.gray)
                                                    + Text(animals.breeds.primary ?? "")
                                                    .foregroundColor(.gray)
                                            }
                                        }
                                        .background(Color.white)
                                        .cornerRadius(30.0)
                                        
                                        

                                    }
                                }
                            }
                            .onAppear{
                                viewModel.fetchToken()
                            }
                        }
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.126, green: 0.347, blue: 0.599)/*@END_MENU_TOKEN@*/)
                    }
                    //Splash Screen
                    ZStack{
                        Color(backgroundColorUI)
                        Image("SPCA_logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 189, height: 197)
                    }
                    .edgesIgnoringSafeArea(.all)
                    .opacity(animate ? 1 : 0)
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()+2){
                    animate.toggle()
                }
            }
        }
    }

struct DetailView: View {
    let animal: Animal
    var body: some View{
        VStack(alignment: .center){
            VStack{
                URLImage(urlString: animal.primary_photo_cropped?.medium ?? "")
                Text(animal.name)
            }
        }
    }
}

struct URLImage: View{
    let urlString: String
    @State var data: Data?
    var body: some View{
        if let data = data, let uiimage = 	UIImage(data: data){
            Image (uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 320, height: 320)
                .cornerRadius(30.0)
                //.clipped()

        }
        else{
            Image("blankPetImage")
                .frame(width: 320, height: 320)
                .clipped()
                .onAppear{
                    fetchImage()
                }
        }
    }
    
    func fetchImage(){
        guard let url = URL(string: urlString)else { return}
        
        let task = URLSession.shared.dataTask(with: url) { data, _data, _ in
            self.data = data
        }
        task.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



}
