//
//  LocationViewController.swift
//  RydWithMe
//
//  Created by macbook on 08/12/2022.
//

import UIKit
import MapKit

class LocationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,MKLocalSearchCompleterDelegate{
   
    
    @IBOutlet weak var tableview: UITableView!
    
    var locations = [Location]()
    var pickupLocation:Location?
    var dropOffLocation:Location?
    
    var searchCompletion = MKLocalSearchCompleter()
    var searchResults = [MKLocalSearchCompletion]()
    
    @IBOutlet weak var dropOffTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        dropOffTextField.delegate = self
        searchCompletion.delegate = self
        dropOffTextField.becomeFirstResponder()
        // Singletin
        locations = LocationService.Shared.getRecentLocations()
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.isEmpty ? locations.count : searchResults.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell")as! LocationCell
        if searchResults.isEmpty{
            let location = locations[indexPath.row]
            cell.updateView(location: location)
        }else{
            let searchResult = searchResults[indexPath.row]
            cell.updateView(searchResult: searchResult)
        }
     
        return cell
    }
    
    //Text field to listen to text when typing
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let latestString = (textField.text as! NSString).replacingCharacters(in: range, with: string)
        if latestString.count > 3{
            searchCompletion.queryFragment = latestString
        }
      
        return true
    }

    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        searchResults = completer.results
        //reload table view
        tableview.reloadData()
    }
}
