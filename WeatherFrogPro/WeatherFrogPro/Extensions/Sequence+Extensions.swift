//
//  Sequence+Extensions.swift
//  csob-ceb-ios
//
//  Created by Libor Kučera on 16.05.17.
//  Copyright © 2017 Zentity, a.s. All rights reserved.
//

// originaly posted by mientus
// http://stackoverflow.com/a/39388832

import Foundation

public extension Sequence {
    func group<U: Hashable>(_ key: (Iterator.Element) -> U) -> [U:[Iterator.Element]] {
        var dict: [U:[Iterator.Element]] = [:]
        for el in self {
            let key = key(el)
            if case nil = dict[key]?.append(el) { dict[key] = [el] }
        }
        return dict
    }
}
