//
//  NavigationController.swift
//  WeatherFrogPro
//
//  Created by Libor Kučera on 15.01.17.
//  Copyright © 2017 Libor Kučera. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        if let topViewController = topViewController {
            return topViewController.preferredStatusBarStyle
        }
        return .lightContent
    }

    override var prefersStatusBarHidden: Bool {
        if let topViewController = topViewController {
            return topViewController.prefersStatusBarHidden
        }
        return false
    }

    @objc func close() {
        if let controller = topViewController as? PresentationDismissable {
            if controller.shouldDismiss() {
                dismiss(animated: true, completion: nil)
            }
        } else {
            dismiss(animated: true, completion: nil)
        }
    }

}
