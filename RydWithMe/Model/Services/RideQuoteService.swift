//
//  RideQuoteService.swift
//  RydWithMe
//
//  Created by macbook on 05/12/2022.
//

import Foundation
import CoreLocation

class RideQuoteService{
    //singletine
    static let shared = RideQuoteService()
    
    private init(){
        
    }
    
    func getQuotes(pickupLocation:Location, dropOffLocation:Location)->[RideQuote]{
        let locationOne = CLLocation(latitude: pickupLocation.lat, longitude: pickupLocation.lng)
        let locationTwo = CLLocation(latitude: dropOffLocation.lat, longitude: dropOffLocation.lng)
        //Meters
        let distance = locationOne.distance(from: locationTwo)
        let minimumAmount = 3.0
        
        return [
            RideQuote(thumbnail: "ride-shared", name: "shared", capacity: "1-2", price: minimumAmount + (distance * 0.5), datte: Date()),
            RideQuote(thumbnail: "ride-compact", name: "shared", capacity: "4", price: minimumAmount + (distance * 0.9), datte: Date()),
            RideQuote(thumbnail: "ride-large", name: "shared", capacity: "6", price: minimumAmount + (distance * 1.5), datte: Date())
        ]
    }
    
}
