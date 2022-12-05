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
    var lontitude:Double
    var longtitude:Double
    
    init(title: String, subtitle: String, lontitude: Double, longtitude: Double) {
        self.title = title
        self.subtitle = subtitle
        self.lontitude = lontitude
        self.longtitude = longtitude
    }
    
}
