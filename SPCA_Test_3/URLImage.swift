//
//  URLImage.swift
//  SPCA_Test_3
//
//  Created by Zane Haubach on 3/15/22.
//

import SwiftUI

struct URLImage: View{
    let urlString: String
    @State var data: Data?
    var body: some View{
        if let data = data, let uiimage =     UIImage(data: data){
            Image (uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
        else{
            Image("blankPetImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
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

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(urlString: "")
    }
}
