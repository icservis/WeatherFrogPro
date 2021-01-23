//
//  LightStylePresentationController.swift
//  csob-ceb-ios
//
//  Created by Libor Kučera on 11.06.17.
//  Copyright © 2017 Zentity, a.s. All rights reserved.
//

import UIKit
import QuartzCore

class LightStylePresentationController: UIPresentationController, CustomPresentationProvidingInternal {

    weak var presentationDelegate: CustomPresentationProviding?

    fileprivate lazy var dimmingView: UIVisualEffectView = {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        let recogniser = UITapGestureRecognizer(target: self, action: #selector(handleClose(_:)))
        view.addGestureRecognizer(recogniser)
        return view
    }()

    @IBAction fileprivate func handleClose(_ sender: UIControl) {
        if let viewController = presentedViewController as? CustomPresentationDismisable {
            close(viewController.shouldDismiss())
        } else if let navController = presentedViewController as? NavigationController,
            let topController = navController.topViewController as? CustomPresentationDismisable {
            close(topController.shouldDismiss())
        } else {
            close()
        }
    }

    private func close(_ allowed: Bool = true) {
        if allowed {
            presentedViewController.dismiss(animated: true, completion: nil)
        }
    }

    override func presentationTransitionWillBegin() {
        if let containerView = containerView {
            containerView.insertSubview(dimmingView, at: 0)
            dimmingView.anchorAllEdgesToSuperview()
            let layer = presentedViewController.view.layer
            layer.cornerRadius = 10
            layer.masksToBounds = true
        }

        guard let coordinator = presentedViewController.transitionCoordinator else {
            return
        }
        let controller = presentedViewController
        presentationDelegate?.presentationWillBegin(controller)
        coordinator.animate(alongsideTransition: nil, completion: nil)
    }

    override func dismissalTransitionWillBegin() {
        guard let coordinator = presentedViewController.transitionCoordinator else {
            dimmingView.removeFromSuperview()
            return
        }
        let controller = presentedViewController
        coordinator.animate(alongsideTransition: nil, completion: { [weak self] _ in
                self?.dimmingView.removeFromSuperview()
                self?.presentationDelegate?.dismissalDidFinish(controller)
        })
    }

    override func containerViewWillLayoutSubviews() {
        presentedView?.frame = frameOfPresentedViewInContainerView
    }

    override func size(forChildContentContainer container: UIContentContainer,
                       withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: parentSize.width - 16,
                      height: parentSize.height - 32)
    }

    override var frameOfPresentedViewInContainerView: CGRect {
        var frame: CGRect = .zero
        let boundsSize = containerView!.bounds.size
        frame.size = size(forChildContentContainer: presentedViewController,
                          withParentContainerSize: boundsSize)
        frame.origin.x = (boundsSize.width - frame.size.width) / 2
        frame.origin.y = (boundsSize.height - frame.size.height)
        return frame
    }
}
