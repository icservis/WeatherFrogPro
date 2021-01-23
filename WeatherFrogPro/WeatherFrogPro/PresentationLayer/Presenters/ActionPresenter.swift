//
//  ActionPresenter.swift
//  csob-ceb-ios
//
//  Created by Daniel Brezina on 8/2/17.
//  Copyright © 2017 Zentity, a.s. All rights reserved.
//

import UIKit

protocol ActionPresenting {
    func presentAction(_ title: String?,
                       with message: String?,
                       with actions: [UIAlertAction],
                       completion: (() -> Swift.Void)?)
}

extension UIViewController: ActionPresenting {
    func presentAction(_ title: String?,
                       with message: String?,
                       with actions: [UIAlertAction],
                       completion: (() -> Void)?) {
        let actionSheet = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        for action in actions {
            actionSheet.addAction(action)
        }
        present(actionSheet, animated: true, completion: nil)
    }
}
