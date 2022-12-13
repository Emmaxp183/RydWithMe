//
//  VehicleAnotation.swift
//  RydWithMe
//
//  Created by macbook on 07/12/2022.
//

import MapKit


class VehicleAnotation: NSObject,MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
