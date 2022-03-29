//
//  DetailView.swift
//  SPCA_Test_3
//
//  Created by Edward Haubach on 3/15/22.
//

import SwiftUI

struct DetailView: View {
    let animal: Animal
    var body: some View{
        ScrollView {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                .padding(.top)
                .foregroundColor(Color.white)

                VStack{
                    Group {
                        URLImage(urlString: animal.primary_photo_cropped?.medium ?? "")
                            .scaledToFill()
                        
                        Text(animal.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Text("Gender: " + animal.gender)
                            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                            .padding([.top, .leading], 10.0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Age: " + animal.age)
                            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                            .padding([.top, .leading], 10.0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Breed: " + (animal.breeds.primary ?? ""))
                            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                            .padding([.top, .leading], 10.0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Size: " + animal.size)
                            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                            .padding([.top, .leading], 10.0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Other Attributes")
                            .font(.title)
                            .padding([.top, .leading], 10.0)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        HStack {
                            Text("Spayed/ Neutered ")
                                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                                .padding([.top, .leading, .bottom], 10.0)
                            
                            if(animal.attributes.spayedNeutered != true) {Image(systemName: "x.circle")}else{Image(systemName: "checkmark.circle")}
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            Text("House Trained ")
                                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                                .padding([.top, .leading, .bottom], 10.0)
                            
                            if(animal.attributes.houseTrained != true) {Image(systemName: "x.circle")}else{Image(systemName: "checkmark.circle")}
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            Text("Declawed ")
                                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                                .padding([.top, .leading, .bottom], 10.0)
                            
                            if(animal.attributes.declawed != true) {Image(systemName: "x.circle")}else{Image(systemName: "checkmark.circle")}
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    HStack {
                        Text("Shots Current ")
                            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                            .padding([.top, .leading, .bottom], 10.0)
                        
                        if(animal.attributes.shotsCurrent != true) {Image(systemName: "x.circle")}else{Image(systemName: "checkmark.circle")}
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        Text("Special Needs ")
                            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                            .padding([.top, .leading, .bottom], 10.0)
                        
                        if(animal.attributes.specialNeeds != true) {Image(systemName: "x.circle")}else{Image(systemName: "checkmark.circle")}
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                 }
            }
        }
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.126, green: 0.347, blue: 0.599)/*@END_MENU_TOKEN@*/)
    }
}


/*struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(animal: ObservedObjectClassType())
    }
}*/
