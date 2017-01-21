//
//  Point+CoreDataProperties.swift
//  WeatherFrogPro
//
//  Created by Libor Kučera on 21.01.17.
//  Copyright © 2017 Libor Kučera. All rights reserved.
//

import Foundation
import CoreData
import CoreLocation

extension Point {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Point> {
        return NSFetchRequest<Point>(entityName: "Point");
    }

    @NSManaged public var countryCode: String?
    @NSManaged public var displayOrder: Int32
    @NSManaged public var name: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var placemark: CLPlacemark?
    @NSManaged public var timestamp: NSDate?
    @NSManaged public var timezone: TimeZone?
    @NSManaged public var url: URL?

}
