//
//  Error+LocalizedError.swift
//  csob-ceb-ios
//
//  Created by Libor Kučera on 18.07.17.
//  Copyright © 2017 Zentity, a.s. All rights reserved.
//

import Foundation

extension Error where Self: LocalizedError {
    var localizedDescription: String {
        if let errorDescription = self.errorDescription {
            return errorDescription
        }
        return ~>.errorUknown
    }
}
