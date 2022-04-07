//
//  DetailView.swift
//  SPCA_Test_3
//
//  Created by Zane Haubach on 3/15/22.
//

import SwiftUI

struct DetailView: View {
    let animal: Animal
    var body: some View{
        let SPCABlue = Color(red: 33/255, green: 88/255, blue: 153/255)
        
        return GeometryReader{ geometry in
            ScrollView{
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                    .padding(.top)
                    .foregroundColor(Color.white)

                    VStack{
                        Group {
                            URLImage(urlString: animal.primary_photo_cropped?.medium ?? "")
                                .scaledToFill()
                                .frame(width: ((geometry.size.width)-20))
                                .cornerRadius(30.0)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(SPCABlue, lineWidth: 10)
                                )
                            
                            Text(animal.name)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Text("Gender: " + animal.gender)
                                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                                .padding([.top, .leading], 10.0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.white)
                            
                            Text("Age: " + animal.age)
                                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                                .padding([.top, .leading], 10.0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.white)
                            
                            Text("Breed: " + (animal.breeds.primary ?? ""))
                                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                                .padding([.top, .leading], 10.0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.white)
                            
                            Text("Size: " + animal.size)
                                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                                .padding([.top, .leading], 10.0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.white)
                            
                            Text("Other Attributes")
                                .font(.title)
                                .padding([.top, .leading], 10.0)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .foregroundColor(.white)
                            
                            HStack {
                                Text("Spayed/ Neutered ")
                                    .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                                    .padding([.top, .leading, .bottom], 10.0)
                                    .foregroundColor(.white)
                                
                                if(animal.attributes.spayedNeutered != true) {Image(systemName: "x.circle")}else{Image(systemName: "checkmark.circle")}
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.white)
                            
                            HStack {
                                Text("House Trained ")
                                    .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                                    .padding([.top, .leading, .bottom], 10.0)
                                    .foregroundColor(.white)
                                
                                if(animal.attributes.houseTrained != true) {Image(systemName: "x.circle")}else{Image(systemName: "checkmark.circle")}
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.white)
                            
                            HStack {
                                Text("Declawed ")
                                    .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                                    .padding([.top, .leading, .bottom], 10.0)
                                    .foregroundColor(.white)
                                
                                if(animal.attributes.declawed != true) {Image(systemName: "x.circle")}else{Image(systemName: "checkmark.circle")}
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.white)
                        }
                        HStack {
                            Text("Shots Current ")
                                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                                .padding([.top, .leading, .bottom], 10.0)
                                .foregroundColor(.white)
                            
                            if(animal.attributes.shotsCurrent != true) {Image(systemName: "x.circle")}else{Image(systemName: "checkmark.circle")}
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.white)
                        
                        HStack {
                            Text("Special Needs ")
                                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                                .padding([.top, .leading, .bottom], 10.0)
                                .foregroundColor(.white)
                            
                            if(animal.attributes.specialNeeds != true) {Image(systemName: "x.circle")}else{Image(systemName: "checkmark.circle")}
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.white)
                     }
                    .frame(width: geometry.size.width-20)
                    .background(SPCABlue)
                    .cornerRadius(30.0)
                    .padding(.top)
                }
            }
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
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


/*struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}*/
