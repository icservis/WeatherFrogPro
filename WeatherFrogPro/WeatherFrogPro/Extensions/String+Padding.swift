//
//  String+Padding.swift
//  csob-ceb-ios
//
//  Created by Libor Kučera on 06.09.17.
//  Copyright © 2017 Zentity, a.s. All rights reserved.
//

import Foundation

extension String {
    func leftPadding(toLength: Int, withPad character: Character) -> String {
        let length = characters.count
        if length < toLength {
            return String(repeatElement(character, count: toLength - length)) + self
        } else {
            return self.substring(from: index(self.startIndex, offsetBy: length - toLength))
        }
    }
}
