//
//  String+Size.swift
//  csob-ceb-ios
//
//  Created by Administrator on 13/07/2017.
//  Copyright © 2017 Zentity, a.s. All rights reserved.
//

import UIKit

extension String {
	func size(for font: UIFont) -> CGSize {
		return self.size(attributes: [NSFontAttributeName: font])
	}

    func size(for font: UIFont, availableWidth: CGFloat) -> CGSize {
        let bounds = self.boundingRect(
            with: CGSize(width: availableWidth, height: .greatestFiniteMagnitude),
            options: .usesLineFragmentOrigin,
            attributes: [NSFontAttributeName: font],
            context: nil
        )

        return bounds.size
    }
}
