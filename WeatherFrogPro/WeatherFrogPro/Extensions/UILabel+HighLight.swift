//
//  UILabel+HighLight.swift
//  csob-ceb-ios
//
//  Created by Libor Kučera on 03.07.17.
//  Copyright © 2017 Zentity, a.s. All rights reserved.
//

import UIKit

private extension String {
    func highlightedRanges(for term: String) -> [NSRange] {
        guard !term.isEmpty else {
            return []
        }

        let nsString = self as NSString
        let startRange = NSRange(location: 0, length: nsString.length)

        let ranges: UnfoldSequence<NSRange, NSRange> = sequence(state: startRange) { range in
            let foundRange = nsString.range(
                of: term,
                options: [.caseInsensitive, .diacriticInsensitive],
                range: range
            )

            guard foundRange.location != NSNotFound else {
                return nil
            }

            let rangeEnd = range.location + range.length
            let nextRange = NSRange(location: rangeEnd, length: nsString.length - rangeEnd)

            range = nextRange
            return foundRange
        }

        return Array(ranges)
    }
}

extension UILabel {
    /// Method used to highLight text found in 'attributedText' property of UILabel
    ///
    /// - Parameter text: text to highlight
    /// - Parameter color: background color for higlLighted text
    /// - Result: boolean true if search text is found otherwise false

    @discardableResult func highlight(text search: String, with backgroundColor: UIColor = .yellow) -> Bool {
        guard let attributedText = attributedText else {
            return false
        }

        let highlightedRanges = attributedText.string.highlightedRanges(for: search)
        guard !highlightedRanges.isEmpty else {
            return false
        }

        guard let buffer = attributedText.mutableCopy() as? NSMutableAttributedString else {
            fatalError("Unreachable code.")
        }

        for range in highlightedRanges {
            buffer.addAttribute(
                NSBackgroundColorAttributeName,
                value: backgroundColor,
                range: range
            )
        }

        self.attributedText = buffer

        return true
    }
}
