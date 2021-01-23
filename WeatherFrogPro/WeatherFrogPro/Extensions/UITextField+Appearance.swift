//
//  UITextField+Appearance.swift
//  csob-ceb-ios
//
//  Created by Igor Shmidt on 16/06/2017.
//  Copyright © 2017 Zentity, a.s. All rights reserved.
//

import UIKit

extension UITextField {
    /// Method set default UITextField appearance – white background, font size
    func setFieldAppearance() {
        tintColor = .csobLightBlue
        textColor = .csobDarkBlue
        backgroundColor = superview?.backgroundColor ?? .csobWhite
        font = UIFont.csobLargeRegularFont
        isOpaque = true
    }
}
