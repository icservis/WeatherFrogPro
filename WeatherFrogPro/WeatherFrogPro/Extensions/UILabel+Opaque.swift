//
//  UILabel+Opaque.swift
//  csob-ceb-ios
//
//  Created by Igor Shmidt on 01/06/2017.
//  Copyright © 2017 Zentity, a.s. All rights reserved.
//

import UIKit

extension UILabel {
    /// Method set default UILabel appearance – opaque with white background, avoiding color blending rendering
    ///
    /// - Parameter asKey: Used on KeyValue data display, 
    /// Key label will have Grey text color, 
    /// Value ( asKey = false ) is Dark Blue,
    /// default false
    func setLabelAppearance(asKey: Bool = false) {
        setLabelAppearance(asKey ? UIColor.csobLightGray : UIColor.csobDarkBlue)
    }

    func setLabelAppearance(_ color: UIColor?, _ font: UIFont? = nil) {
        if let font = font { self.font = font }
        if let color = color { self.textColor = color }
        backgroundColor = superview?.backgroundColor ?? .csobWhite
        isOpaque = true
    }
}
