//
//  ErrorPresenter.swift
//  csob-ceb-ios
//
//  Created by Libor Kučera on 08.05.17.
//  Copyright © 2017 Zentity, a.s. All rights reserved.
//

import UIKit

protocol ErrorPresenting {
    func presentError(_ message: String, with title: String?, completion: (() -> Swift.Void)?)

    func presentError(_ message: String, with title: String?, actions: [UIAlertAction])
}

extension UIViewController: ErrorPresenting {
    func presentError(_ message: String, with title: String? = nil, completion: (() -> Void)? = nil) {
        presentError(message, with: title, actions: [
            UIAlertAction(title: NSLocalizedString("OK", comment: "Answer OK"), style: .default) { _ in completion?() }
            ])
    }

    func presentError(_ message: String, with title: String? = nil, actions: [UIAlertAction]) {
        let resolvedTitle = title ?? NSLocalizedString("Aler", comment: "Alert title")
        let alert = UIAlertController(title: resolvedTitle, message: message, preferredStyle: .alert)
        if actions.isEmpty { alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Answer OK"), style: .default)) }

        actions.forEach { alert.addAction($0) }
        present(alert, animated: true, completion: nil)

    }
}
