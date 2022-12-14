//
//  HomeViewController.swift
//  RydWithMe
//
//  Created by macbook on 05/12/2022.
//

import UIKit
import CoreLocation
import MapKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, CLLocationManagerDelegate,MKMapViewDelegate {
    
    
    @IBOutlet weak var searchButton: UIButton!
    var Locations = [Location]()
    //Propertier for the map
    var locationManager:CLLocationManager!
    var currentUserLocation:Location!
    
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
        //Map
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            locationManager.startUpdatingLocation()
        }
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
    
    //Map
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let firstLocation = locations.first!
        currentUserLocation = Location(title: "Current Location", subtitle: "", lat: firstLocation.coordinate.latitude, lng: firstLocation.coordinate.longitude)
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse{
            locationManager.startUpdatingLocation()
        }
    }
    
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let distance = 200.0
        let region = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: distance, longitudinalMeters: distance)
        mapView.setRegion(region, animated: true)
        
        
        //Proprties of map anotaations
        let offset = 0.00075
        let lat = userLocation.coordinate.latitude
        let lng = userLocation.coordinate.longitude
        let coordinateOne = CLLocationCoordinate2D(latitude: lat - offset, longitude: lng - offset)
        let coordinateTwo = CLLocationCoordinate2D(latitude: lat, longitude: lng + offset)
        let coordinateThree = CLLocationCoordinate2D(latitude: lat, longitude: lng - offset)
        
        //Adding vehicle Anotation on the map
        mapView.addAnnotations([
            VehicleAnotation(coordinate: coordinateOne),
            VehicleAnotation(coordinate: coordinateTwo),
            VehicleAnotation(coordinate: coordinateThree)
        ])
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        //Constant properties for reuseIdentifier
        let reuseIdentifier = "vehicle"
        let VehicleImage = "car"
       
        if annotation is MKUserLocation{
            return nil
        }
        //Custom annotation view with vehicle image
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)
        if annotationView == nil{
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier:reuseIdentifier)
        }else{
            annotationView?.annotation = annotation
        }
        annotationView?.image = UIImage(named: VehicleImage)
        //Rotation of the vehicle
        annotationView?.transform = CGAffineTransform(rotationAngle: CGFloat(arc4random_uniform(360) * 180) / CGFloat.pi)
        return annotationView
    }
}
