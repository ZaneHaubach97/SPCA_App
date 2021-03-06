//
//  ViewModel.swift
//  SPCA_Test_3
//
//  Created by Zane Haubach on 3/2/22.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject{
    @Published var animals: [Animal] = []
    
    //Function used to coordinate the actions of all functions below it in this file
    func doStuff(){
        fetchToken(){ (APIKey) in
            let request: URLRequest = self.buildRequest(accessToken: APIKey)
            self.fetchData(request: request) { json in
                DispatchQueue.main.async {
                   self.animals = json.animals
                }
            }
        }
    }
    
    //Function used to retrieve the API Key from the petfinder API using the userID and secret key
    func fetchToken(completion: @escaping ((String) -> Void)){
        guard let url = URL(string: "https://api.petfinder.com/v2/oauth2/token") else{return}
        let payload = "grant_type=client_credentials&client_id=GUQj1MdQN3QunoxXz4vdd0DHPlcJC6yuqCLCEXavriJ4W6wTYV&client_secret=7whgSG3ZX6m9Cwfr2vEakOH90fSn3g0isIlae0CC".data(using: .utf8)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = payload

        URLSession.shared.dataTask(with: request) {data, _, error in
            guard let data = data, error == nil else{return}
            let APItoken: token = try! JSONDecoder().decode(token.self, from: data)
            completion(APItoken.access_token)
        }
        .resume()
    }
    
    //Function used to build the request sent to the fetchData function.  When used this request will return the list of pet information.
    func buildRequest(accessToken: String) -> URLRequest{
        let url = URL(string: "https://api.petfinder.com/v2/animals?organization=VA174")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue((" Bearer " + accessToken), forHTTPHeaderField: "Authorization")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        return request
    }
    
    //Function that utilizes the returned value of the buildRequest function to talk to the API and retrieve the pet information from PetFinder
    func fetchData(request: URLRequest, completion: @escaping ((AnimalResponse) -> Void)){

        let task = URLSession.shared.dataTask(with: request) {data, _, error in
            guard let data = data, error == nil else{return}
            do{
                let json = try! JSONDecoder().decode(AnimalResponse.self, from: data)
                completion(json)
            }
        }
        task.resume()
    }
}
