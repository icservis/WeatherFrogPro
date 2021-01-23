//
//  CustomPresentationManager.swift
//  csob-ceb-ios
//
//  Created by Libor Kučera on 11.06.17.
//  Copyright © 2017 Zentity, a.s. All rights reserved.
//

import UIKit

enum CustomPresentationStyle {
    case light
    case dark
    case pagePop
}

protocol CustomPresentationProviding: class {
    func presentationWillBegin(_ controller: UIViewController)
    func dismissalDidFinish(_ controller: UIViewController)
}

protocol CustomPresentationProvidingInternal: class {
    var presentationDelegate: CustomPresentationProviding? { get set }
}

protocol CustomPresentationDismisable: PresentationDismissable { }

extension CustomPresentationDismisable where Self: UIViewController {
    func shouldDismiss() -> Bool {
        return true
    }
}

class CustomPresentationManager: NSObject {
    var style: CustomPresentationStyle

    init(style: CustomPresentationStyle) {
        self.style = style
        super.init()
    }
}

extension CustomPresentationManager: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController,
                                presenting: UIViewController?,
                                source: UIViewController) -> UIPresentationController? {

        let presentationController: UIPresentationController & CustomPresentationProvidingInternal

        switch style {
        case .light:
            presentationController = LightStylePresentationController(
                presentedViewController: presented,
                presenting: presenting
            )
        case .dark:
            presentationController = DarkStylePresentationController(
                presentedViewController: presented,
                presenting: presenting
            )
        case .pagePop:
            presentationController = PagePopStylePresentationController(
                presentedViewController: presented,
                presenting: presenting
            )
        }

        if let delegate = source as? CustomPresentationProviding {
            presentationController.presentationDelegate = delegate
        }
        return presentationController
    }
}
