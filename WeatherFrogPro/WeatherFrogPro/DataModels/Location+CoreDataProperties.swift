//
//  Location+CoreDataProperties.swift
//  WeatherFrogPro
//
//  Created by Libor Kučera on 16.01.17.
//  Copyright © 2017 Libor Kučera. All rights reserved.
//

import Foundation
import CoreData
import CoreLocation

extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location");
    }

    @NSManaged public var altitude: Float
    @NSManaged public var displayOrder: Int32
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var name: String?
    @NSManaged public var placemark: CLPlacemark?
    @NSManaged public var timestamp: NSDate?
    @NSManaged public var timezone: NSTimeZone?
    @NSManaged public var countryCode: String?

}
