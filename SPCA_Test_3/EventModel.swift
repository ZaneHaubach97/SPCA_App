//
//  EventModel.swift
//  WebTest
//
//  Created by Zane Haubach on 3/30/22.
//

import Foundation

struct Event: Hashable{
    var eventName: String
    var image: String
    var details: [String]
    var link: String
}
