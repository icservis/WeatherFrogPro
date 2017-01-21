//
//  DataManager.swift
//  WeatherFrogPro
//
//  Created by Libor Kučera on 21.01.17.
//  Copyright © 2017 Libor Kučera. All rights reserved.
//

import Foundation
import Alamofire

class DataManager {
    
    
    static let sharedInstance : DataManager = {
        let instance = DataManager()
        return instance
    }()
    
    var cache : Cache
    
    convenience init() {
        let cache = Cache()
        self.init(cache: cache)
    }
    
    init(cache : Cache) {
        self.cache = cache
    }
    
    
}
