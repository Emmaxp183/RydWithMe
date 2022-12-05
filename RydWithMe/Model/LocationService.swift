//
//  LocationService.swift
//  RydWithMe
//
//  Created by macbook on 05/12/2022.
//

import Foundation

class LocationService{
    //Share my class
    static let Shared = LocationService()
    //Empty array
    var recentLocation = [Location]()
   
    //Json to location model
    private init(){
        let locationUrl = Bundle.main.url(forResource: "locations", withExtension: "json")!
        let data = try! Data(contentsOf: locationUrl)
        let decoder = JSONDecoder()
        recentLocation = try! decoder.decode([Location].self, from: data)
    }
    func getRecentLocations()-> [Location]{
        return recentLocation
    }
}
