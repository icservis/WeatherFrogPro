//
//  MapViewController.swift
//  WeatherFrogPro
//
//  Created by Libor Kučera on 15.01.17.
//  Copyright © 2017 Libor Kučera. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController {
    
    var searchController : UISearchController? = nil
    
    var mapStoreDelegate : MapStore? = nil
    
    var location : Location? = nil
    var selectedPlacemark : MKPlacemark? = nil
    
    @IBOutlet weak var mapView: MKMapView!
    

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
        
        self.mapView?.showsUserLocation = true
        
        if let location = self.location {
            self.selectedPlacemark = MKPlacemark(coordinate: (location.placemark!.location?.coordinate)!, addressDictionary: location.placemark?.addressDictionary as! [String : Any]?)
            self.showAnnotation(with: self.selectedPlacemark!)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showAnnotation(with placemark: MKPlacemark) {
        
        self.mapView.removeAnnotations(self.mapView.annotations)
        let annotation = MKPointAnnotation()
        annotation.coordinate = placemark.coordinate
        annotation.title = placemark.name
        annotation.subtitle = (placemark.addressDictionary!["FormattedAddressLines"] as! [String]).joined(separator: ", ")
        self.mapView.addAnnotation(annotation)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: placemark.coordinate, span: span)
        self.mapView.setRegion(region, animated: true)
        
    }

}

protocol MapStore {
    func store(pin: MKPlacemark)
}

extension MapViewController : MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
        pinView?.pinTintColor = UIColor.orange
        pinView?.canShowCallout = true
        let button = UIButton(type: .contactAdd)
        //button.addTarget(self, action: "getDirections", for: .touchUpInside)
        pinView?.leftCalloutAccessoryView = button
        return pinView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        self.mapStoreDelegate?.store(pin: self.selectedPlacemark!)
    }
}

extension MapViewController : HandleSearchMap {
    
    func dropPinZoomIn(to mapItem: MKMapItem) {
        
        self.searchController?.isActive = false
        self.selectedPlacemark = mapItem.placemark
        self.showAnnotation(with: self.selectedPlacemark!)
    }
    
}

