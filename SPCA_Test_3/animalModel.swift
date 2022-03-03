//
//  animalModel.swift
//  SPCA_Test_3
//
//  Created by Zane Haubach on 3/2/22.
//

import Foundation

struct token: Decodable {
    let access_token: String
}

struct enviornment: Decodable{
    let children: Bool?
    let dogs: Bool?
    let cats: Bool?
}
struct attributes: Codable {
    let spayedNeutered, houseTrained: Bool?
    let declawed: Bool?
    let specialNeeds, shotsCurrent: Bool?

    enum CodingKeys: String, CodingKey {
        case spayedNeutered = "spayed_neutered"
        case houseTrained = "house_trained"
        case declawed
        case specialNeeds = "special_needs"
        case shotsCurrent = "shots_current"
    }
}

struct photo: Codable {
    let small, medium, large, full: String?
}

struct breeds: Decodable {
    let primary: String?
    let secondary: String?
    let mixed, unknown: Bool?
}

struct Animal: Decodable, Identifiable{
    let id = UUID()
    let type: String
    let species: String
    let breeds: breeds
    let age: String
    let gender: String
    let size: String
    let attributes: attributes
    let name: String
    let primary_photo_cropped: photo?
    let status: String
}

struct AnimalResponse: Decodable{
    let animals: [Animal]
}
