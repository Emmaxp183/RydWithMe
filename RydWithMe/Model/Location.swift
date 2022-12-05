//
//  Location.swift
//  RydWithMe
//
//  Created by macbook on 05/12/2022.
//

import Foundation

class Location:Codable{
    var title:String
    var subtitle:String
    var lat:Double
    var lng:Double
    
    init(title: String, subtitle: String, lat: Double, lng: Double) {
        self.title = title
        self.subtitle = subtitle
        self.lat = lat
        self.lng = lng
    }
}
