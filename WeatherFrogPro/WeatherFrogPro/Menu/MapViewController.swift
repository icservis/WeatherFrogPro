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
    
    let geocoder = CLGeocoder()
    
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
        let longPressGestureRecogniser = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        longPressGestureRecogniser.minimumPressDuration = 0.5
        longPressGestureRecogniser.delaysTouchesBegan = true
        longPressGestureRecogniser.delegate = self
        self.mapView.addGestureRecognizer(longPressGestureRecogniser)
        
        if let placemark = self.location?.placemark {
            
            self.selectedPlacemark = MKPlacemark(coordinate: (placemark.location?.coordinate)!, addressDictionary: placemark.addressDictionary as! [String : Any]?)
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
    func update(pin: MKPlacemark)
}

extension MapViewController : MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
        pinView?.canShowCallout = true
        pinView?.isDraggable = true
        
        let annotationLocation = CLLocation(latitude: annotation.coordinate.latitude, longitude: annotation.coordinate.longitude)
        if let locationLocation = self.location?.placemark?.location {
            let distance = locationLocation.distance(from: annotationLocation)
            let isStoredLocation = distance < kCLLocationAccuracyNearestTenMeters
            if isStoredLocation {
                pinView?.tag = 1
                pinView?.pinTintColor = MKPinAnnotationView.greenPinColor()
            } else {
                pinView?.tag = 0
                pinView?.pinTintColor = MKPinAnnotationView.purplePinColor()
                pinView?.leftCalloutAccessoryView = UIButton(type: .contactAdd)
            }
        } else {
            pinView?.pinTintColor = MKPinAnnotationView.purplePinColor()
            pinView?.leftCalloutAccessoryView = UIButton(type: .contactAdd)
        }
        
        return pinView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        self.mapStoreDelegate?.store(pin: self.selectedPlacemark!)
        self.showAnnotation(with: self.selectedPlacemark!)
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationViewDragState, fromOldState oldState: MKAnnotationViewDragState) {
        if newState == .ending {
            let location = CLLocation(latitude: (view.annotation?.coordinate.latitude)!, longitude: (view.annotation?.coordinate.longitude)!)
            geocoder.reverseGeocodeLocation(location, completionHandler: {
                placemarks, error in
                if let placemark = placemarks?.first {
                    self.selectedPlacemark = MKPlacemark(coordinate: location.coordinate, addressDictionary: placemark.addressDictionary as! [String:Any]?)
                    self.showAnnotation(with: self.selectedPlacemark!)
                }
                if let pinView = view as? MKPinAnnotationView {
                    if pinView.tag == 1 {
                        self.mapStoreDelegate?.update(pin: self.selectedPlacemark!)
                    }
                }
            })
        }
    }
}

extension MapViewController : HandleSearchMap {
    
    func dropPinZoomIn(to mapItem: MKMapItem) {
        
        self.searchController?.isActive = false
        self.selectedPlacemark = mapItem.placemark
        self.showAnnotation(with: self.selectedPlacemark!)
    }
    
}

extension MapViewController : UIGestureRecognizerDelegate {
    
    func handleLongPress(gestureRecogniser: UILongPressGestureRecognizer) {
        if gestureRecogniser.state == .ended {
            let touchLocation = gestureRecogniser.location(in: self.mapView)
            let locationCoordinate = self.mapView.convert(touchLocation, toCoordinateFrom: self.mapView)
            let location = CLLocation(latitude: locationCoordinate.latitude, longitude: locationCoordinate.longitude)
            geocoder.reverseGeocodeLocation(location, completionHandler: {
                placemarks, error in
                if let placemark = placemarks?.first {
                    self.selectedPlacemark = MKPlacemark(coordinate: location.coordinate, addressDictionary: placemark.addressDictionary as! [String:Any]?)
                    self.showAnnotation(with: self.selectedPlacemark!)
                }
            })
            
        }
    }
}

