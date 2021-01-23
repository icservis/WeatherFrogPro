//
//  CALayer+CSOB.swift
//  csob-ceb-ios
//
//  Created by Denis Bogomolov on 23/04/2017.
//  Copyright © 2017 Zentity, a.s. All rights reserved.
//

import UIKit

extension CALayer {
    func csob_addShadow() {
        shadowOffset = CGSize(width: 0, height: 1)
        shadowColor = UIColor.csobBlack.cgColor
        shadowRadius = 3.0
        shadowOpacity = 0.1
    }
    func csob_addBorder() {
        borderColor = UIColor.csobCardBorder.cgColor
        borderWidth = 1
    }
    func csob_addCornerRadius() {
        cornerRadius = 10
    }
}
