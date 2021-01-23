//
//  Configurator.swift
//  WeatherFrogPro
//
//  Created by Libor Kučera on 03.10.17.
//  Copyright © 2017 Libor Kučera. All rights reserved.
//

import Foundation

protocol ConfigProviding: class {
    var environment: Environment { get }
}

class Configurator: ConfigProviding {
    
    static let shared : Configurator = {
        let instance = Configurator()
        return instance
    }()

    var environment: Environment

    convenience init() {
        let environment: Environment = .debug
        self.init(environment: environment)
    }

    init(environment : Environment) {
        self.environment = environment
    }
}
