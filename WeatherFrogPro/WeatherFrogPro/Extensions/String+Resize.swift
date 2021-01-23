//
//  String.swift
//  csob-ceb-ios
//
//  Created by Yan Zaitsev on 06/09/2017.
//  Copyright © 2017 Zentity, a.s. All rights reserved.
//

import Foundation

extension String {
    //If string length is less then target length, it will be filled with filler characters at begin.
    //If string length is greater then target length, it will be trimmed to required length at end of string
    func resized(to length: Int, with filler: Character) -> String {
        let currentLength = characters.count
        if currentLength < length {
            return String(repeatElement(filler, count: length - currentLength)) + self
        } else {
            return self.substring(from: index(self.startIndex, offsetBy: currentLength - length))
        }
    }
}
