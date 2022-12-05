//
//  RideQuote.swift
//  RydWithMe
//
//  Created by macbook on 05/12/2022.
//

import Foundation

class RideQuote{
    
    let thumbnail: String
    let name:String
    let capacity:String
    let price:Double
    let time:Date
    
    init(thumbnail: String, name: String, capacity: String, price: Double, datte: Date) {
        self.thumbnail = thumbnail
        self.name = name
        self.capacity = capacity
        self.price = price
        self.time = datte
    }
}
