//
//  Location+MKAnnotation.swift
//  WeatherFrogPro
//
//  Created by Libor Kučera on 16.01.17.
//  Copyright © 2017 Libor Kučera. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

extension Point : MKAnnotation {
    
    public var coordinate: CLLocationCoordinate2D {
        get {
            let placemark: CLPlacemark? = self.placemark! as CLPlacemark
            return (placemark?.location!.coordinate)!
        }
    }
    public var title: String? {
        get {
            let placemark: CLPlacemark? = self.placemark! as CLPlacemark
            return self.name ?? placemark?.name
        }
    }
    public var subtitle: String? {
        get {
            let placemark: CLPlacemark? = self.placemark! as CLPlacemark
            return (placemark?.addressDictionary!["FormattedAddressLines"] as! [String]).joined(separator: ", ")
        }
    }
    
}

