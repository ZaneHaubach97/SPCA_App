/*
//  ViewModel.swift
//  SPCA_Test_3
//
//  Created by Zane Haubach on 3/2/22.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject{
    @Published var animals: [Animal] = []
    
    func fetchToken(){
        guard let url = URL(string: "https://api.petfinder.com/v2/oauth2/token") else{return}
        let payload = "grant_type=client_credentials&client_id=GUQj1MdQN3QunoxXz4vdd0DHPlcJC6yuqCLCEXavriJ4W6wTYV&client_secret=7whgSG3ZX6m9Cwfr2vEakOH90fSn3g0isIlae0CC".data(using: .utf8)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = payload

        let task = URLSession.shared.dataTask(with: request) {data, _, error in
            guard let data = data, error == nil else{return}
            let APItoken: token = try! JSONDecoder().decode(token.self, from: data)
            self.fetchData(accessToken: APItoken.access_token)
        }
        task.resume()
    }
    
    func fetchData(accessToken: String){
        let url = URL(string: "https://api.petfinder.com/v2/animals?organization=VA174")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue((" Bearer " + accessToken), forHTTPHeaderField: "Authorization")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")

        let task = URLSession.shared.dataTask(with: request) {[weak self] data, _, error in
            guard let data = data, error == nil else{return}
            
            do{
                let json = try! JSONDecoder().decode(AnimalResponse.self, from: data)
                DispatchQueue.main.async {
                    self?.animals = json.animals
                }
            }
        }
        task.resume()
    }
}

*/
