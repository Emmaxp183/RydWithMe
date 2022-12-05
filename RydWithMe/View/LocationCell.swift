//
//  LocationCell.swift
//  RydWithMe
//
//  Created by macbook on 05/12/2022.
//

import UIKit

class LocationCell: UITableViewCell {

    @IBOutlet weak var addressLine1: UILabel!
    @IBOutlet weak var addressLine2: UILabel!
    
    func updateView(location:Location){
        addressLine1.text = location.title
        addressLine2.text = location.subtitle
    }
}
