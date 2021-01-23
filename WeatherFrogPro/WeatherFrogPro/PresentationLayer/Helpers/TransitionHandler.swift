//
//  TransitionHandler.swift
//  csob-ceb-ios
//
//  Created by Denis Bogomolov on 12/03/2017.
//  Copyright © 2017 Zentity, a.s. All rights reserved.
//

import UIKit
import SafariServices
import MessageUI

protocol TransitionHandler: class {
    func push(_ controller: UIViewController, animated: Bool)
    func present(_ controller: UIViewController,
                 style: CustomPresentationStyle,
                 animated: Bool,
                 completion: (() -> Void)?)
    func popup(_ controller: UIViewController,
               animated: Bool,
               completion: (() -> Void)?)
    func hidePopup(animated: Bool, completion: (() -> Void)?)
    func pop(to controller: UIViewController, animated: Bool)
    func pop(animated: Bool)
}

protocol PresentationDismissable: class {
    func shouldDismiss() -> Bool
}

extension TransitionHandler where Self: UIViewController {
    func push(_ controller: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(controller, animated: animated)
    }
    func present(_ controller: UIViewController,
                 style: CustomPresentationStyle = .light,
                 animated: Bool = true,
                 completion: (() -> Void)?) {
        let manager = CustomPresentationManager(style: style)
        let navController = NavigationController(rootViewController: controller)

        switch style {
        case .light:
            let barButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                target: navController,
                                                action: #selector(navController.close)
            )
            controller.navigationItem.leftBarButtonItem = barButtonItem
        case .pagePop:
            let barButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                target: navController,
                                                action: #selector(navController.close)
            )
            controller.navigationItem.leftBarButtonItem = barButtonItem
        case .dark:
            controller.navigationItem.leftBarButtonItem = nil
        }
        navController.transitioningDelegate = manager
        navController.modalPresentationStyle = .custom
        present(navController, animated: animated, completion: completion)
    }
    func popup(_ controller: UIViewController,
               animated: Bool = true,
               completion: (() -> Void)? = nil) {
        if controller is NavigationController || controller is UIAlertController {
            present(controller, animated: animated, completion: completion)
            return
        }
        let navController = NavigationController(rootViewController: controller)
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                target: navController,
                                                action: #selector(navController.close)
        )
        controller.navigationItem.leftBarButtonItem = barButtonItem
        present(navController, animated: animated, completion: completion)

    }
    func hidePopup(animated: Bool = true, completion: (() -> Void)? = nil) {
        dismiss(animated: animated, completion: completion)
    }
    func pop(to controller: UIViewController, animated: Bool = true) {
        navigationController?.popToViewController(controller, animated: animated)
    }
    func pop(animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }
}
