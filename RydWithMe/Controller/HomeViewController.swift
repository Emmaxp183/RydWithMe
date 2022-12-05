//
//  HomeViewController.swift
//  RydWithMe
//
//  Created by macbook on 05/12/2022.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  

    @IBOutlet weak var searchButton: UIButton!
    var Locations = [Location]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let recentLocation = LocationService.Shared.getRecentLocations()
        Locations = [recentLocation[0],recentLocation[1]]
        //Shadow to search button
        searchButton.layer.cornerRadius = 10.0
        searchButton.layer.shadowRadius = 1.0
        searchButton.layer.shadowColor = UIColor.black.cgColor
        searchButton.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        searchButton.layer.shadowOpacity = 0.5

    }
    
//Tabel View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Locationcell") as! LocationCell
        let location = Locations[indexPath.row]
        cell.updateView(location: location)
        return cell
    }
    


}
