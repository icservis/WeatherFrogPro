//
//  Location+MKAnnotation.swift
//  WeatherFrogPro
//
//  Created by Libor Kučera on 16.01.17.
//  Copyright © 2017 Libor Kučera. All rights reserved.
//

import Foundation
import MapKit

extension Location : MKAnnotation {
    
    public var coordinate: CLLocationCoordinate2D {
        get {
            return CLLocationCoordinate2DMake(self.latitude, self.longitude)
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

