//
//  String+Mod97Check.swift
//  PABK
//
//  Created by Ondrej Hanslik on 12/08/16.
//  Copyright ÂŠ 2016 ZENTITY a.s. All rights reserved.
//

import Foundation

extension String {
    fileprivate func mod97() -> Int {
        let symbols = self.characters
        let swapped = symbols.dropFirst(4) + symbols.prefix(4)

        let mod: Int = swapped.reduce(0) { (previousMod, char) in
            let value = Int(String(char), radix: 36)! // "0" => 0, "A" => 10, "Z" => 35

            if value < 10 {
                return (10 * previousMod + value) % 97
            }

            return (100 * previousMod + value) % 97
        }

        return mod
    }

    func mod97Checksum() -> String {
        let mod = 98 - self.mod97()

        if mod < 10 {
            return "0\(mod)"
        }

        return String(mod)
    }

    func passesMod97Check() -> Bool {
        guard self.characters.count >= 4 else {
            return false
        }

        let uppercase = self.uppercased()

        guard uppercase.range(of: "^[0-9A-Z]*$", options: .regularExpression) != nil else {
            return false
        }

        return (self.mod97() == 1)
    }

    func passesMod11Check() -> Bool {
        guard self.range(of: "^\\d+$", options: .regularExpression) != nil else {
            return false
        }

        let symbols = self.unicodeScalars

        let validationWeights: [UInt32] = [6, 3, 7, 9, 10, 5, 8, 4, 2, 1]
        let weightedSum: UInt32 = symbols.enumerated().map { (index, char) in
            let charValue = char.value - ("0" as UnicodeScalar).value
            let weight = validationWeights[index]

            return charValue * weight
            }.reduce(0, +)

        return (weightedSum % 11 == 0)
    }
}
