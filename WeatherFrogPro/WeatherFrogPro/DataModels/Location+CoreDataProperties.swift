//
//  Location+CoreDataProperties.swift
//  WeatherFrogPro
//
//  Created by Libor Kučera on 17.01.17.
//  Copyright © 2017 Libor Kučera. All rights reserved.
//

import Foundation
import CoreData
import CoreLocation

extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location");
    }

    @NSManaged public var displayOrder: Int32
    @NSManaged public var name: String?
    @NSManaged public var placemark: CLPlacemark?
    @NSManaged public var timestamp: NSDate?
    @NSManaged public var countryCode: String?
    @NSManaged public var timezone: TimeZone?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var url: URL?

}
