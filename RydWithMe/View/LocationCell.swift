//
//  LocationCell.swift
//  RydWithMe
//
//  Created by macbook on 05/12/2022.
//

import UIKit
import MapKit

class LocationCell: UITableViewCell {

    @IBOutlet weak var addressLine1: UILabel!
    @IBOutlet weak var addressLine2: UILabel!
    
    func updateView(location:Location){
        addressLine1.text = location.title
        addressLine2.text = location.subtitle
    }
    
    func updateView(searchResult:MKLocalSearchCompletion){
        addressLine1.text = searchResult.title
        addressLine2.text = searchResult.subtitle
    }
}
