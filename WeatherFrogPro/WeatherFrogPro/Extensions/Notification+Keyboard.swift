//
//  Notification+Keyboard.swift
//  csob-ceb-ios
//
//  Created by Ondrej Hanslik on 06/09/2017.
//  Copyright © 2017 Zentity, a.s. All rights reserved.
//

import UIKit

extension NSNotification {
    var keyboardEndFrame: CGRect {
        guard
            let userInfo = self.userInfo,
            let value = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue
        else {
            return CGRect.null
        }

        return value.cgRectValue
    }

    var keyboardAnimationOptions: UIViewAnimationOptions {
        guard
            let userInfo = self.userInfo,
            let value = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? Int,
            let animationCurve = UIViewAnimationCurve(rawValue: value)
        else {
            return []
        }

        switch animationCurve {
        case .linear:
            return [.curveLinear]
        case .easeIn:
            return [.curveEaseIn]
        case .easeOut:
            return [.curveEaseOut]
        case .easeInOut:
            return [.curveEaseInOut]
        }
    }

    var keyboardAnimationDuration: TimeInterval {
        guard
            let userInfo = self.userInfo,
            let interval = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval
        else {
            return 0
        }

        return interval
    }
}
