//
//  Resolver.swift
//  csob-ceb-ios
//
//  Created by Denis Bogomolov on 14/03/2017.
//  Copyright © 2017 Zentity, a.s. All rights reserved.
//

import Swinject

extension Resolver {
    /// Retrieves the instance with the specified service type.
    ///
    /// - Returns: The resolved service type instance, or nil if no service is found.
    func resolve<Service>() -> Service? {
        return resolve(Service.self)
    }
}
