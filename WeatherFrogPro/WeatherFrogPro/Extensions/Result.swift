//
//  Result.swift
//  csob-ceb-ios
//
//  Created by Libor Kučera on 26.04.17.
//  Copyright © 2017 Zentity, a.s. All rights reserved.
//

import Foundation
import Result

extension Result where T: Equatable, Error: Equatable {
    func equal(to rhs: Result<T, Error>) -> Bool {
        switch (self, rhs) {
        case let (.success(left), .success(right)):
            return left == right
        case let (.failure(left), .failure(right)):
            return left == right
        case (.success, _):
            return false
        case (.failure, _):
            return false
        }
    }
}
