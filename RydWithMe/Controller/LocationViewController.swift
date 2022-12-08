//
//  LocationViewController.swift
//  RydWithMe
//
//  Created by macbook on 08/12/2022.
//

import UIKit

class LocationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    

    var locations = [Location]()
    var pickupLocation:Location?
    var dropOffLocation:Location?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Singletin
        locations = LocationService.Shared.getRecentLocations()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell")as! LocationCell
        let location = locations[indexPath.row]
        cell.updateView(location: location)
        return cell
    }
    

}
