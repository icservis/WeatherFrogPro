//
//  String+Separator.swift
//  csob-ceb-ios
//
//  Created by Libor Kučera on 29.08.17.
//  Original code by Igor Shmidt
//  Copyright © 2017 Zentity, a.s. All rights reserved.
//

import Foundation

extension String {
    func stringByInserting(separator: String, every: Int) -> String {
        return inserting(separator: separator, every: every)
    }

    private func inserting(separator: String, every: Int) -> String {
        var result: String = ""
        let characters = Array(self.characters)
        let ccount: Int = characters.count
        stride(from: 0, to: ccount, by: every).forEach { (num: Int) in
            let newp: Int = num + every
            let range = num..<min(newp, ccount)
            result.append(String(characters[range]))
            if newp < ccount {
                result.append(separator)
            }
        }
        return result
    }

    func trimmingAllWhitespaces() -> String {
        return self.replacingOccurrences(of: "\\s", with: "", options: .regularExpression)
    }
}
