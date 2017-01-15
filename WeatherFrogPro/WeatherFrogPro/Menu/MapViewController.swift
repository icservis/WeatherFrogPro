//
//  MapViewController.swift
//  WeatherFrogPro
//
//  Created by Libor Kučera on 15.01.17.
//  Copyright © 2017 Libor Kučera. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class MapViewController: UIViewController {
    
    var searchController : UISearchController? = nil
    
    var selectedPin: MKMapItem? = nil;
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let locationSearchTable = MapSearchTableController()
        locationSearchTable.mapView = self.mapView
        locationSearchTable.handleMapSearchDelegate = self
        
        self.searchController = UISearchController(searchResultsController: locationSearchTable)
        self.searchController!.searchResultsUpdater = locationSearchTable
        self.searchController!.dimsBackgroundDuringPresentation = true
        self.searchController!.hidesNavigationBarDuringPresentation = false
        self.definesPresentationContext = true
        
        let searchBar = self.searchController!.searchBar;
        self.navigationItem.titleView = searchBar
        searchBar.delegate = locationSearchTable
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.requestLocation()
        self.mapView?.showsUserLocation = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    

}

// MARK: - Location


extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        self.mapView.setRegion(region, animated: true)
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error:" + error.localizedDescription)
    }
    
}

extension MapViewController : HandleSearchMap {
    
    func dropPinZoomIn(to mapItem: MKMapItem) {
        self.selectedPin = mapItem
        
        self.mapView.removeAnnotations(self.mapView.annotations)
        self.searchController?.isActive = false
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = mapItem.placemark.coordinate
        annotation.title = mapItem.name
        annotation.subtitle = (mapItem.placemark.addressDictionary!["FormattedAddressLines"] as! [String]).joined(separator: ", ")
        self.mapView.addAnnotation(annotation)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: mapItem.placemark.coordinate, span: span)
        self.mapView.setRegion(region, animated: true)
        
    }
    
}

extension MapViewController : MKMapViewDelegate {
    
}

