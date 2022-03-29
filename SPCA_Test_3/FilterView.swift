//
//  FilterView.swift
//  SPCA_Test_3
//
//  Created by Zane Haubach on 3/10/22.
//

import SwiftUI

struct FilterView: View {
    @StateObject var viewModel = ViewModel()
    @State private var didTapAP:Bool = false
    @State private var didTapDog:Bool = false
    @State private var didTapCat:Bool = false
    @State private var didTapReset:Bool = false
    @State private var didTapMale:Bool = false
    @State private var didTapFemale:Bool = false
    @Binding var showFilterMenu: Bool
    let SPCABlue = Color(red: 33/255, green: 88/255, blue: 153/255)
    @Binding var filterCriteria: criteria
    
    var body: some View {
        VStack(alignment: .leading){
            
            HStack{
                //code for reset button
                HStack {
                    Button("Reset    "){
                        self.didTapReset = true;
                        filterCriteria.type = ""
                        filterCriteria.gender = ""
                        filterCriteria.age = ""
                        filterCriteria.size = ""
                        self.didTapAP = false; self.didTapCat = false; self.didTapDog = false; self.didTapMale = false; self.didTapFemale = false
                    }
                    .font(.system(size: 18))
                    .background(didTapReset ? SPCABlue : SPCABlue)
                    .cornerRadius(15.0)
                .foregroundColor(didTapReset ? Color.white : Color.white)
                }
                .padding(.top, 20)
                //Spacer()
                
                Text("Filter")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding([.top, .leading, .trailing])
                    .foregroundColor(SPCABlue)
                
                Button {
                    withAnimation{
                        showFilterMenu.toggle()
                    }
                } label: {
                    Image(systemName: "x.circle")
                }
                .padding([.top, .leading], 11.0)
                .scaleEffect(1.5)
                .foregroundColor(SPCABlue)
            }
            .padding(.top, 40)
            
            HStack {
                
                //Code for top row of filter options (type: all pets, dogs, cats)
                Button("All Pets    "){
                    self.didTapAP = true; self.didTapCat = false; self.didTapDog = false
                    filterCriteria.type = ""
                }
                .font(.system(size: 18))
                .background(didTapAP ? SPCABlue : Color.yellow)
                .cornerRadius(15.0)
                .foregroundColor(didTapAP ? Color.white : Color.white)
                Button("Dogs        "){
                    self.didTapAP = false; self.didTapDog = true; self.didTapCat = false
                    filterCriteria.type = "Dog"
                }
                .font(.system(size: 18))
                .background(didTapDog ? SPCABlue : Color.yellow)
                .cornerRadius(15.0)
                .foregroundColor(didTapCat ? Color.white : Color.white)
                Button("Cats        "){
                    self.didTapAP = false; self.didTapDog = false; self.didTapCat = true
                    filterCriteria.type = "Cat"
                }
                .font(.system(size: 18))
                .background(didTapCat ? SPCABlue : Color.yellow)
                .cornerRadius(15.0)
                .foregroundColor(didTapCat ? Color.white : Color.white)
            }
            .padding(.top, 50)
            .foregroundColor(Color.white)
            
            
            
            //code for second row of filter options (gender: male, female)
            HStack{
                Button("Male    "){
                    self.didTapMale = true; self.didTapFemale = false
                    filterCriteria.gender = "Male"
                }
                .font(.system(size: 18))
                .background(didTapMale ? SPCABlue : Color.yellow)
                .cornerRadius(15.0)
                .foregroundColor(didTapMale ? Color.white : Color.white)
                Button("Female        "){
                    self.didTapMale = false; self.didTapFemale = true
                    filterCriteria.gender = "Female"
                }
                .font(.system(size: 18))
                .background(didTapFemale ? SPCABlue : Color.yellow)
                .cornerRadius(15.0)
                .foregroundColor(didTapFemale ? Color.white : Color.white)
            }
            .padding(.top, 30)
            .foregroundColor(Color.white)
            
            
            
            //Code for third row of filter options (age: baby, young, adult, senior)
            HStack {
                Menu("Age    ", content: {
                    Button("Baby", action: {filterCriteria.age = "Baby"})
                    Button("Young", action: {filterCriteria.age = "Young"})
                    Button("Adult", action: {filterCriteria.age = "Adult"})
                    Button("Senior", action: {filterCriteria.age = "Senior"})
                })
                .foregroundColor(Color.white)
                .font(.system(size: 18))
                .background(Color.yellow)
                .cornerRadius(15.0)
                .foregroundColor(didTapFemale ? Color.white : Color.white)
                
                Text(filterCriteria.age)
                    .foregroundColor(Color.black)
            }
            .padding(.top, 30)

            
            
            //Code for fourth row of filter options (Size: Small, Meduim, Large, Xlarge )
            HStack {
                Menu("Size    ", content: {
                    Button("Small", action: {filterCriteria.size = "Small"})
                    Button("Medium", action: {filterCriteria.size = "Medium"})
                    Button("Large", action: {filterCriteria.size = "Large"})
                    Button("Xlarge", action: {filterCriteria.size = "Xlarge"})
                })
                .foregroundColor(Color.white)
                .font(.system(size: 18))
                .background(Color.yellow)
                .cornerRadius(15.0)
                .foregroundColor(didTapFemale ? Color.white : Color.white)
                
                Text(filterCriteria.size)
                    .foregroundColor(Color.black)
            }
            .padding(.top, 40)
            Spacer()
            
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 0.956, green: 0.961, blue: 0.969))
        .edgesIgnoringSafeArea(.all)
    }
}

func filterAnimals(animals: [Animal], by filters: criteria) -> [Animal]{
    var filteredAnimals = animals
    
    if(filters.type != ""){
        filteredAnimals = filteredAnimals.filter({ $0.type == filters.type })
    }
    if(filters.age != ""){
        filteredAnimals = filteredAnimals.filter({ $0.age == filters.age })
    }
    if(filters.gender != ""){
        filteredAnimals = filteredAnimals.filter({ $0.gender == filters.gender })
    }
    if(filters.size != ""){
        filteredAnimals = filteredAnimals   .filter({ $0.size == filters.size })
    }
    return filteredAnimals
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(showFilterMenu: .constant(false), filterCriteria: .constant(.init(type: "", age: "", gender: "", size: "")))
    }
}

