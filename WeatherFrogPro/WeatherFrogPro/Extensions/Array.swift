//
//  Array.swift
//  csob-ceb-ios
//
//  Created by Libor Kučera on 22.05.17.
//  Copyright © 2017 Zentity, a.s. All rights reserved.
//

import Foundation

public extension Array where Element: Equatable {
    func after(_ element: Element) -> Element? {
        guard let index = index(of: element), index + 1 < self.count else { return nil }
        return self[index + 1]
    }
    func before(_ element: Element) -> Element? {
        guard let index = index(of: element), index > 0 else { return nil }
        return self[index - 1]
    }
}

public extension Array {
    // swiftlint:disable:next identifier_name
    mutating func moveItem(from: Int, to: Int) {
        guard indices.contains(from) && indices.contains(to) else { return }
        insert(remove(at: from), at: to)
    }
}

// Compare two optional Arrays with Euatable elements
// original posted https://stackoverflow.com/a/40903286

func ==<T: Equatable>(lhs: [T]?, rhs: [T]?) -> Bool {
    switch (lhs, rhs) {
    case (.some(let lhs), .some(let rhs)):
        return lhs == rhs
    case (.none, .none):
        return true
    default:
        return false
    }
}
